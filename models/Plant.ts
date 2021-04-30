import {  } from "../deps.ts";

export class Plant{
  constructor(
    public id: number,
    public name: string,
    public kind: string,
    public lateinName: string,
    public honeyEfficiency: number | null,
    public pollenEfficiency: number | null)
  {
    this.id = id;
    this.name = name;
    this.kind = kind;
    this.lateinName = lateinName;
    this.honeyEfficiency = honeyEfficiency;
    this.pollenEfficiency = pollenEfficiency;
  }
}