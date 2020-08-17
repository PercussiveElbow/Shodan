module Shodan
  struct HostDataRedis
    include JSON::Serializable
    property cpu : HostDataRedisCPUData
    # property clients : Hash(String,String)
    property cluster : Hash(String, Int64)?
    property keys : HostDataRedisKeys?
    property keyspace : Hash(String, String)
    property memory : HostDataRedisMemory?
    property pacluster : Hash(String, String)?
    property persistence : HostDataRedisPersistence?
    property replication : HostDataRedisReplication?
    property server : HostDataRedisServer
    property ssl : HostDataRedisSSL?
    @[JSON::Field(key: "oom-prevention")]
    property oom_prevention : HostDataRedisOOMPrevention?
    property stats : Hash(String, Float64)
  end

  struct HostDataRedisReplication
    include JSON::Serializable
    property repl_backlog_size : Int64?
    property master_repl_offset : Int64?
    property repl_backlog_histlen : Int64?
    property repl_backlog_active : Int64?
    property master_replid : String?
    property master_replid2 : String?
    property connected_slaves : Int64?
    property role : String?
    property repl_backlog_first_byte_offset : Int64?
    property second_repl_offset : Int64?
  end

  struct HostDataRedisPersistence
    include JSON::Serializable
    property aof_rewrite_in_progress : Int64?
    property loading : Int64?
    property rdb_last_bgsave_status : String?
    property aof_rewrite_scheduled : Int64?
    property aof_enabled : Int64?
    property aof_last_bgrewrite_status : String?
    property aof_last_rewrite_time_sec : Float64?
    property rdb_current_bgsave_time_sec : Float64?
    property rdb_bgsave_in_progress : Int64?
    property rdb_last_cow_size : Int64?
    property rdb_last_save_time : Int64?
    property rdb_changes_since_last_save : Int64?
    property aof_current_rewrite_time_sec : Float64?
    property aof_last_cow_size : Int64?
    property aof_last_write_status : String?
    property rdb_last_bgsave_time_sec : Int64?
  end

  struct HostDataRedisMemory
    include JSON::Serializable
    property mem_clients_normal : Int64?
    property rss_overhead_ratio : Float64?
    property used_memory_peak_human : String?
    property used_memory_dataset_perc : String?
    property used_memory_peak_perc : String?
    property allocator_frag_ratio : Float64?
    property used_memory_lua_human : String?
    property used_memory : Int64?
    property used_memory_scripts : Int64?
    property maxmemory : Int64?
    property used_memory_scripts_human : String?
    property total_system_memory_human : String?
    property allocator_rss_ratio : Float64?
    property allocator_frag_bytes : Int64?
    property mem_not_counted_for_evict : Int64?
    property mem_replication_backlog : Int64?
    property lazyfree_pending_objects : Int64?
    property allocator_rss_bytes : Int64?
    property mem_aof_buffer : Int64?
    property rss_overhead_bytes : Float64?
    property allocator_allocated : Int64?
    property number_of_cached_scripts : Int64?
    property maxmemory_policy : String?
    property maxmemory_human : String?
    property used_memory_human : String?
    property active_defrag_running : Int64?
    property used_memory_startup : Int64?
    property allocator_active : Int64?
    property mem_clients_slaves : Int64?
    property used_memory_lua : Int64?
    property used_memory_overhead : Int64?
    property total_system_memory : Int64?
    property mem_allocator : String?
    property mem_fragmentation_bytes : Int64?
    property used_memory_peak : Int64?
    property allocator_resident : Int64?
    property used_memory_rss : Int64?
    property mem_fragmentation_ratio : Float64?
    property used_memory_rss_human : String?
    property used_memory_dataset : Int64?
  end

  struct HostDataRedisKeys
    include JSON::Serializable
    property data : Array(String)
    property more : Bool
  end

  struct HostDataRedisServer
    include JSON::Serializable
    property arch_bits : Int64
    property atomicvar_api : String?
    property config_file : String?
    property configured_hz : Int64?
    property executable : String?
    property gcc_version : String?
    property hz : Int64
    property lru_clock : Int64
    property multiplexing_api : String
    property os : String
    property process_id : Int64
    property redis_build_id : String
    property redis_git_dirty : Int64
    property redis_git_sha1 : Int64
    property redis_mode : String
    property redis_version : String
    property rlec_version : String?
    property run_id : String
    property tcp_port : Int64
    property uptime_in_days : Int64
    property uptime_in_seconds : Int64
  end

  struct HostDataRedisCPUData
    include JSON::Serializable
    property used_cpu_sys : Float64
    property used_cpu_sys_children : Float64
    property used_cpu_user : Float64
    property used_cpu_user_children : Float64
  end

  struct HostDataRedisSSL
    include JSON::Serializable
    property ssl_connections_to_current_certificate : Int64
    property ssl_connections_to_previous_certificate : Int64
    property ssl_current_certificate_not_after_date : String
    property ssl_current_certificate_not_before_date : String
    property ssl_current_certificate_serial : Int64
    property ssl_enabled : String
  end

  struct HostDataRedisOOMPrevention
    include JSON::Serializable
    property oom_prevention_on : String
    property peak_used_memory_total : Int64
    property oom_prevention_threshold : Int64
    property used_memory_rdb : Int64
    property used_memory_aof : Int64
    property used_memory_total : Int64
    property current_useconds_with_oom_prevention_on : Int64
    property total_useconds_with_oom_prevention_on : Int64
    property oom_prevention_threshold_human : String
    property used_memory_rdb_human : String
    property used_memory_aof_human : String
    property used_memory_total_human : String
    property peak_used_memory_total_human : String
  end
end
