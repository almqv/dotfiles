#!/usr/bin/env python

"""
Script to get current workspaces and related
data using wmctrl.
"""

import re
import sys
import json
from subprocess import check_output, CalledProcessError

# Config
HIDE_EMPTY_WS = True  # Exclude empty workspaces
OVERIDE_ALL_NAMES = False  # Override all the WS names and use the name below
OVERIDE_ALL_NAME = ""  # Name to use when overriding names
NAME_MAPS: dict[int, str] = {
    # 0: "",
    # 1: ""
}
LOG_FILE = "/tmp/eww_workspace.log"  # Log file (in case of errors etc)

# Compile regex patterns
PARSE_REGEX = re.compile(r"^(\d+)\s+(\*|\-).+\s+(\w+)$")

WMCTRL_SCRIPT = "wmctrl -d"
NONEMPTY_SCRIPT = "wmctrl -l"


class Workspace:
    """
    Class for a workspace
    """

    def __init__(self, index: int, name: str, iscurrent: bool, isempty: bool):
        self.index = index
        if OVERIDE_ALL_NAMES:
            self.name = OVERIDE_ALL_NAME
        elif index in NAME_MAPS:
            self.name = NAME_MAPS[index]
        else:
            self.name = name
        self.iscurrent = iscurrent
        self.isempty = isempty

    def to_json(self):
        """
        Converts the given object to json
        """
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True)


def parse_groups(grps: tuple) -> tuple:
    """
    Parses the given regex groups
    """
    return int(grps[0]), grps[2], grps[1] == "*"


def parse_workspaces():
    """
    Function to get all the workspaces
    """

    nonempty_workspaces = set()
    try:
        nonempty = check_output(NONEMPTY_SCRIPT.split(" "))
        nonempty = nonempty.decode("utf-8")

        for line in nonempty.splitlines():
            try:
                ws_num = line[12]
                nonempty_workspaces.add(int(ws_num))
            except:
                continue
    except CalledProcessError:
        pass

    try:
        inp = check_output(WMCTRL_SCRIPT.split(" "))
        inp = inp.decode("utf-8")
    except CalledProcessError as err:
        with open(LOG_FILE, "a") as logfile:
            logfile.write(
                "ERROR! COULD NOT PARSE WORKSPACES OR SOMETHING! YOU ARE ON YOUR OWN."
            )
            logfile.write(f"{err}")

        inp = ""

    out = []

    for line in inp.splitlines():
        matches = PARSE_REGEX.search(line)
        if matches:
            grps = matches.groups()
            data = parse_groups(grps)
            workspace = Workspace(*data, data[0] not in nonempty_workspaces)
            out.append(workspace)

    return out


if __name__ == "__main__":
    # NOTE: use deflisten
    LAST_STRING = ""
    while True:
        workspaces = parse_workspaces()
        workspaces = [
            ws
            for ws in workspaces
            if ws.iscurrent or (not ws.isempty) or (not HIDE_EMPTY_WS)
        ]

        json_str = json.dumps(workspaces, default=lambda ws: ws.to_json())

        if json_str != LAST_STRING:
            print(f"{json_str}", flush=True)  # Output to eww

        LAST_STRING = json_str
