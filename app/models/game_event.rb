class GameEvent
  MOVE_EVENTS = ['up', 'left', 'right', 'down', 'leftStop', 'rightStop', 'upStop']

  def self.handleEvent(game_data)
    player = Player.add_player(game_data) if game_data['gameEvent'] == 'start'
    player = Player.updated_player_for_move_event(game_data) if MOVE_EVENTS.include?(game_data['gameEvent'])
    player = Player.handle_fire(game_data) if game_data['gameEvent'] == 'fire'
    GameEventBroadcastJob.perform_later(player)
  end
end
