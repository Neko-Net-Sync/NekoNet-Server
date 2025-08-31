using NekoNet.API.Data.Enum;

namespace NekoNetShared.Utils;
public record ClientMessage(MessageSeverity Severity, string Message, string UID);
