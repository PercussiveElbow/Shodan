module Shodan
  struct HostDataMonero
    include JSON::Serializable
    property credits : Int64?
    property top_hash : String?
    property alt_blocks_count : Int64
    property block_size_limit : Int64
    property block_size_median : Int64?
    property block_weight_limit : Int64?
    property block_weight_median : Int64?
    property bootstrap_daemon_address : String?
    property connections : Array(HostDataMoneroAddress)
    property cumulative_difficulty : Int64
    property cumulative_difficulty_top64 : Int64?
    property database_size : Int64?
    property difficulty : Int64
    property difficulty_top64 : Int64?
    property free_space : Int64?
    property grey_peerlist_size : Int64?
    property height : Int64
    property height_without_bootstrap : Int64?
    property incoming_connections_count : Int64?
    property mainnet : Bool?
    property nettype : String?
    property offline : Bool?
    property outgoing_connections_count : Int64
    property rpc_connections_count : Int64?
    property stagenet : Bool?
    property start_time : Int64?
    property status : String
    property target : Int64
    property target_height : Int64
    property testnet : Bool
    property top_block_hash : String
    property tx_count : Int64
    property tx_pool_size : Int64?
    property untrusted : Bool?
    property update_available : Bool?
    property version : String?
    property was_bootstrap_ever_used : Bool?
    property white_peerlist_size : Int64
    property wide_cumulative_difficulty : String?
    property wide_difficulty : String?
  end

  struct HostDataMoneroAddress
    include JSON::Serializable
    property address : String
    property avg_download : Int64
    property avg_upload : Int64
    property connection_id : String
    property current_download : Int64
    property current_upload : Int64
    property height : Int64
    property host : String
    property ip : String
    property incoming : Bool
    property live_time : Int64
    property local_ip : Bool
    property localhost : Bool
    property peer_id : String
    property port : String
    property pruning_seed : Int64?
    property rpc_port : Int64?
    property recv_count : Int64
    property recv_idle_time : Int64
    property state : String
    property support_flags : Int64
  end
end
