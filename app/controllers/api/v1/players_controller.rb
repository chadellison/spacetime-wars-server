module Api
  module V1
    class PlayersController < ApplicationController
      def index
        IpAddress.handle_ip_address(request.remote_ip)
        render json: {
          players: Player.get_players,
          defenseData: Game.find_defense_data
        }
      end
    end
  end
end
