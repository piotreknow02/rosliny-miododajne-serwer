import { Client, multiParser, ExecuteResult } from "../deps.ts";
import Plant from "../models/Plant.ts";

export default class PlantController {
  private client!: Client;
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
    const data = await this.client.execute(await Deno.readTextFile("./database/select-all.sql"));
    return this.MapData(data);
  }
  public async GetFromQuery(formQuery: any): Promise<Plant[]>
  {
    const query = this.queryToCommand(formQuery);
    try
    {
      const data = await this.client.execute(await query);
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
  public async init(): Promise<void>
  {
    this.client.execute(await Deno.readTextFile("./database/rosliny-create-db.sql"));
    this.client.execute(await Deno.readTextFile("./database/rosliny-insert.sql"));
    console.log("Database initialized");
  }
}