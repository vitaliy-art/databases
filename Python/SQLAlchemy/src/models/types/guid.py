import uuid

from sqlalchemy import CHAR, TypeDecorator


class GUID(TypeDecorator):
    """https://gist.github.com/gmolveau/7caeeefe637679005a7bb9ae1b5e421e
    """

    impl = CHAR
    cache_ok = True

    def load_dialect_impl(self, dialect):
        return dialect.type_descriptor(CHAR(32))

    def process_bind_param(self, value, _):
        if value is None:
            return value
        else:
            if not isinstance(value, uuid.UUID):
                return "%.32x" % uuid.UUID(value).int
            else:
                return "%.32x" % value.int

    def process_result_value(self, value, _):
        return self._uuid_value(value)

    def sort_key_function(self, value):
        return self._uuid_value(value)
