#!/usr/bin/env python

"""
Script to get current workspaces and related
data using wmctrl.
"""

import re
import sys
import json
from subprocess import check_output

# Config
HIDE_EMPTY_WS = True  # Exclude empty workspaces
OVERIDE_ALL_NAMES = False
OVERIDE_ALL_NAME = ""
NAME_MAPS = {
    # 0: "",
    # 1: ""
}


# NOTE: DO NOT TOUCH
WMCTRL_SCRIPT = "wmctrl -d"
PARSE_REGEX = r"^(\d+)\s+(\*|\-).+\s+(\w+)$"

NONEMPTY_REGEX = r"^\w+\s+(\w+|\d+).+$"
WMCTRL_NONEMPTY_SCRIPT = "wmctrl -l"


def parse_groups(grps: tuple) -> tuple:
    """
    Parses the given regex groups
    """
    return int(grps[0]), grps[2], grps[1] == "*"


class Workspace:
    """
    Class for a workspace
    """

    def __init__(self, index: int, name: str, iscurrent: bool, isempty: bool):
        self.index = index
        if OVERIDE_ALL_NAMES:
            self.name = OVERIDE_ALL_NAME
        elif index in NAME_MAPS.keys():
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


def parse_workspaces():
    """
    Function to get all the workspaces
    """

    inp = check_output(WMCTRL_SCRIPT.split(" "))
    inp = inp.decode("utf-8")

    nonempty = check_output(WMCTRL_NONEMPTY_SCRIPT.split(" "))
    nonempty = nonempty.decode("utf-8")

    nonempty_workspaces = re.findall(NONEMPTY_REGEX,
                                     nonempty,
                                     flags=re.MULTILINE)
    nonempty_workspaces = list(map(int, nonempty_workspaces))

    out = []

    for line in inp.splitlines():
        matches = re.search(PARSE_REGEX, line)
        grps = matches.groups()
        data = parse_groups(grps)
        workspace = Workspace(*data, data[0] not in nonempty_workspaces)

        out.append(workspace)

    return out


if __name__ == "__main__":
    args = sys.argv

    # NOTE: use deflisten
    LAST_STRING = ""
    while True:
        workspaces = parse_workspaces()
        workspaces = list(filter(lambda ws:
                                 (ws.iscurrent)
                                 or (not ws.isempty)
                                 or (not HIDE_EMPTY_WS),
                                 workspaces))

        json_str = json.dumps(workspaces, default=lambda ws: ws.to_json())

        if json_str != LAST_STRING:
            print(f"{json_str}", flush=True)  # Output to eww

        LAST_STRING = json_str
