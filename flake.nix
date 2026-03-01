{
  description = "Personal project templates";

  outputs = { self, ... }: {
    templates = {
      node-ts = {
        path = ./node-ts;
        description = "Node.js + TypeScript project with LSP config";
      };
      node-ts-monorepo = {
        path = ./node-ts-monorepo;
        description = "pnpm monorepo with TypeScript and LSP config";
      };
    };

    # Default template
    defaultTemplate = self.templates.node-ts;
  };
}
