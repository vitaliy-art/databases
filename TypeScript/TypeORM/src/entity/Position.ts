export enum Position {

    Boss,
    Manager,
    Staffer,

}

export function positionString(position: number): string {
    switch (Number(position)) {
        case Position.Boss: return "Boss";
        case Position.Manager: return "Manager";
        case Position.Staffer: return "Staffer";
    }
}
