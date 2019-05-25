ExUnit.start

Application.ensure_all_started(:bypass)

Mox.defmock(MoxExample.TwitterMock, for: MoxExample.Twitter)
