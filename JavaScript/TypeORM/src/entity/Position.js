export const Position = {
    Boss: 0,
    Manager: 1,
    Staffer: 2,

    /**
     *
     * @param {number} id
     * @returns string
     */
    toString(id) {
        return [
            "Boss",
            "Manager",
            "Staffer",
        ][id]
    }
}
