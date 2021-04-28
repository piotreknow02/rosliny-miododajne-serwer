import { Router, RouterContext } from "./deps.ts";
import PlantController from "./controllers/plantController.ts";

const router: Router = new Router();
const controller = new PlantController(Deno.env.get("MYSQL_SERVER_ADDR")!);

// router.post("/plants", async (ctx: RouterContext) => {
//     ctx.response.type = "application/json";
//     console.log((await ctx.request.body()).value);
//     const data = await controller.GetFromQuery(await ctx.request.body().value);
//     ctx.response.body = JSON.stringify(data);
// });

router.get("/all-plants", async (ctx: RouterContext) => {
    ctx.response.type = "application/json";
    const data = await controller.getAllPlants();
    ctx.response.body = JSON.stringify(data);
});

router.get("/", (ctx: RouterContext) => {
    ctx.response.redirect("https://github.com/piotreknow02/rosliny-miododajne-client");
});

export { router };