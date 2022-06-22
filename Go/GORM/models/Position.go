package models

type Position uint

const (
	Boss Position = iota
	Manager
	Staffer
)

func (p Position) String() string {
	return map[Position]string{
		Boss:    "Boss",
		Manager: "Manager",
		Staffer: "Staffer",
	}[p]
}
