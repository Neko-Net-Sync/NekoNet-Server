using System.ComponentModel.DataAnnotations;

namespace NekoNetShared.Models;

public class BannedRegistrations
{
    [Key]
    [MaxLength(100)]
    public string DiscordIdOrLodestoneAuth { get; set; }
}
