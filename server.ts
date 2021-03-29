import { Application } from "./deps.ts";
import { router } from "./router.ts";

const app = new Application();

app.use(router.routes());
app.use(router.allowedMethods());

app.addEventListener('listen', ({port}) => console.log(`Running on port ${port}...`));

await app.listen({ port: 3000 });