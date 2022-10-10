from enum import Enum

class CobolLineTypeEnum(Enum):
    BLANK = 1
    COMMENT = 2
    COMPILER_DIRECTIVE = 3
    CONTINUATION = 4
    DEBUG = 5
    NORMAL = 6