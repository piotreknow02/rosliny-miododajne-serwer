import { Client, multiParser, ExecuteResult } from "../deps.ts";
import Plant from "../models/Plant.ts";

export default class PlantController {
  private client!: Client;
  private initialized = false;
  constructor(host: string)
  {
    new Client().connect({
      hostname: host,
      username: "root",
      db: "RoslinyMiododajne",
      password: Deno.env.get("MYSQL_ROOT_PASSWORD"),
    }).then((cli: Client) => this.client = cli);
  }
  public async getAllPlants(): Promise<Plant[]>
  {
    const data = await this.client.query(await Deno.readTextFile("./database/select-all.sql"));
    return this.MapData(data);
  }
  public async GetFromQuery(formQuery: any): Promise<Plant[]>
  {
    const query = this.queryToCommand(formQuery);
    try
    {
      const data = await this.client.query(await query);
      return this.MapData(data);
    }
    catch
    {
      throw new Error("Invalid query");
    }
  }
  private MapData(data: ExecuteResult): Plant[]
  {
    return data.rows!.map((element: any) => 
      new Plant(element.id, element.nazwa, element.kind, element.nazwaLacinska, element.wydajnoscMiodowa, element.wydajnoscPylkowa, element.kraj)
    );
  }
  private async queryToCommand(query: any): Promise<string>
  {
    return (await multiParser(query))?.fields.query!;
  }
}