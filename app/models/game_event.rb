class GameEvent
  def self.handleEvent(game_data)
    player = Player.add_player(game_data) if game_data['gameEvent'] == 'start'
    player = Player.updated_player_for_move_event(game_data) if ['up', 'left', 'right', 'down'].include?(game_data['gameEvent'])
    GameEventBroadcastJob.perform_later(player)
  end
end
