export default class Parcela {
    constructor(id, date) {
        this._id = id;
        this._date = date;
        this._valor = 0;
    }

    get id() {
        return this._id;
    }

    get date() {
        return this._date;
    }

    get valor() {
        return this._valor;
    }
}