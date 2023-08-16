using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Save
{
    public interface ISaveModule
    {
        Task<SavedTournamentPlayerScoreDto> SavedTournamentPlayerScore(SaveTournamentPlayerScoreDto payload);
    }
}