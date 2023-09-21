package fields

import (
	"fmt"
	"strconv"

	"github.com/beego/beego/v2/client/orm"
)

type PositionField int32

const (
	Staffer PositionField = iota
	Manager
	Boss
)

func (p PositionField) Value() int32 {
	return int32(p)
}

func (p *PositionField) Set(value int32) {
	*p = PositionField(value)
}

func (p *PositionField) String() string {
	value := *p
	switch value {
	case Staffer:
		return "Staffer"
	case Manager:
		return "Manager"
	case Boss:
		return "Boss"
	default:
		return "Unknown"
	}
}

func (p *PositionField) FieldType() int {
	return orm.TypeIntegerField
}

func (p *PositionField) SetRaw(value any) (err error) {
	switch d := value.(type) {
	case int32:
		p.Set(d)
	case int64:
		p.Set(int32(d))
	case string:
		var v int64
		v, err = strconv.ParseInt(d, 10, 32)
		if err == nil { // if err == nil
			p.Set(int32(v))
		}
	default:
		err = fmt.Errorf("position raw value should be int32 or string, but received '%T'", d)
	}
	return
}

func (p *PositionField) RawValue() any {
	return p.Value()
}

var _ orm.Fielder = new(PositionField)
