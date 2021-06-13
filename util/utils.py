import pathlib
import re
from typing import Union, List


def natural_keys(path: pathlib.Path) -> List[Union[int, str]]:
    """Sort path names by its cardinal numbers.

    Parameters
    ----------
    path : pathlib.Path
      The element to be sorted.
    """

    def atoi(c: str) -> Union[int, str]:
        """Try to convert a character to an int if possible.

        Parameters
        ----------
        c : str
          The character to check if it's int.
        """
        return int(c) if c.isdigit() else c

    return [atoi(c) for c in re.split('(\d+)', path.stem)]