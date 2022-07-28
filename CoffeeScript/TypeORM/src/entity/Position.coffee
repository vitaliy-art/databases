export Position =
  Boss: 0
  Manager: 1
  Staffer: 2

  toString: (id ###:number###) ###:string### ->
    [
      "Boss"
      "Manager"
      "Staffer"
    ][id]
