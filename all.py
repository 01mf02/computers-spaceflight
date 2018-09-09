from pfcompat import toJSONFilters
from pandoc_latex_environment import environment
from figure import figure

if __name__ == "__main__":
    toJSONFilters([environment, figure])
