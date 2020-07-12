require "granite/adapter/pg"

Granite::Connections << Granite::Adapter::Pg.new(name="main", url: ENV.fetch("DATABASE_URL"))
