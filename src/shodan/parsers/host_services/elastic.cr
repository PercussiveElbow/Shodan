module Shodan
  struct HostDataElastic
    include JSON::Serializable
    property cluster : HostDataElasticCluster?
    property nodes : HostDataElasticNode
    property indices : Hash(String, HostDataElasticIndex)?
  end

  struct HostDataElasticCluster
    include JSON::Serializable
    property cluster_name : String?
    property cluster_uuid : String?
    property indices : HostDataElasticIndices?
    property nodes : HostDataElasticNodes?
    property _nodes : HostDataElasticNodesMore?
    property status : String?
    property timestamp : Int64?
  end

  struct HostDataElasticNodesMore
    include JSON::Serializable
    property failed : Int64?
    property failures : Array(HostDataElasticFailure)?
    property successful : Int64?
    property failure : Int64?
  end

  struct HostDataElasticFailure
    include JSON::Serializable
    property caused_by : HostDataElasticFailureCausedBy?
    property node_id : String?
    property reason : String?
    property type : String?
  end

  struct HostDataElasticFailureCausedBy
    include JSON::Serializable
    property caused_by : String
    property reason : String
    property type : String
  end

  # Node
  struct HostDataElasticNode
    include JSON::Serializable
    property cluster_name : String?
    property nodes : HostDataElasticNodeInfo?
    property _Nodes : HostDataElasticNodeStat?
  end

  struct HostDataElasticNodeStat
    include JSON::Serializable
    property failed : Int64?
    property succcessful : Int64
    property total : Int64?
    property failures : Array(HostDataElasticFailure)?
  end

  struct HostDataElasticAttributes
    include JSON::Serializable
    property aws_availability_zone : String?
    property box_type : String?
    property client : String?
    property data : String?
    property fault_domain : String?
    property local : String?
    property master : String?
    property master_local_storage_nodes : String?

    @[JSON::Field(key: "ml.enabled")]
    property ml_enabled : String?
    @[JSON::Field(key: "ml.enabled_memory")]
    property ml_enabled_memory : String?
    @[JSON::Field(key: "ml.machine_memory")]
    property ml_machine_memory : String?
    @[JSON::Field(key: "ml.max_open_jobs")]
    property ml_max_open_jobs : String?
    property rack : String?
    property role : String?
    property update_domain : String?
    property xpack : String?
  end

  struct HostDataElasticNodeCPUData
    include JSON::Serializable
    property cache_size_in_bytes : Int64?
    property cores_per_socket : Int64?
    property mhz : Int64?
    property model : String?
    property total_cores : Int64?
    property total_sockets : Int64?
    property vendor : String?
  end

  struct HostDataElasticIngest
    include JSON::Serializable
    property processors : Array(HostDataElasticProcessor)?
    property processor_stats : Hash(String, String)?
    property number_of_pipelines : Int64?
  end

  struct HostDataElasticNodeHTTP
    include JSON::Serializable
    property bound_address : Hash(String, String)
    property max_content_length_in_bytes : Int64?
    property publish_address : String?
  end

  struct HostDataElasticJVM
    include JSON::Serializable
    property gc_collectors : Array(String)?
    property input_arguments : Array(String)?
    property mem : HostDataElasticJVMMemory?
    property memory_pools : Array(String)?
    property pid : Int64?
    property stat_time_in_millis : Int64?
    property using_compressed_ordinary_object_pointers : String?
    property vm_name : String?
    property vm_vendor : String?
    property vm_version : String?
    property version : String?
  end

  struct HostDataElasticModule
    include JSON::Serializable
    property classname : String?
    property description : String?
    property elasticsearch_version : String?
    property extended_plugins : Array(String)?
    property has_native_controller : Bool?
    property isolate : Bool?
    property java_Version : String?
    property jvm : Bool?
    property name : String?
    property requires_keystore : Bool?
    property site : Bool?
    property version : String?
  end

  struct HostDataElasticNetwork
    include JSON::Serializable
    property primary_interface : HostDataElasticPrimaryInterface?
    property refresh_interval_in_millis : Int64?
  end

  struct HostDataElasticNodeInfo
    include JSON::Serializable
    property thread_pool : Hash(String, String)?
    property settings : Hash(String, String)?
    property attributes : HostDataElasticAttributes?
    property build : String?
    property build_flavour : String?
    property build_hash : String?
    property build_type : String?
    property http : HostDataElasticNodeHTTP?
    property http_address : String?
    property host : String?
    property ip : String?
    property ingest : String?
    property jvm : HostDataElasticJVM?
    property modules : Array(HostDataElasticModule)?
    property name : String?
    property network : HostDataElasticNetwork?
    property os : HostDataElasticOsInfo?
    property plugins : Array(HostDataElasticPlugin)?
    property process : HostDataElasticProcess?
    property roles : Array(String)?
    property total_indexing_buffer : Int64?
    property transport : HostDataElasticTransport?
    property transport_address : String?
    property version : String?
  end

  struct HostDataElasticOsInfo
    include JSON::Serializable
    property allocated_processors : Int64?
    property arch : String?
    property available_processors : Int64?
    property cpu : HostDataElasticNodeCPUData?
    property mem : HostDataElasticOsMemory?
    property name : String?
    property pretty_name : String?
    property refresh_interval_in_millis : Int64?
    property swap : HostDataElasticSwap?
    property version : String?
  end

  struct HostDataElasticPlugin
    include JSON::Serializable
    property classname : String?
    property description : String?
    property elasticsearch_version : String?
    property extended_plugins : Array(String)?
    property has_native_controller : Bool?
    property isolated : Bool?
    property java_version : String?
    property jvm : Bool?
    property name : String?
    property requires_keystore : Bool?
    property site : Bool?
    property url : String?
    property version : String?
  end

  struct HostDataElasticPrimaryInterface
    include JSON::Serializable
    property address : String
    property mac_address : String
    property name : String
  end

  struct HostDataElasticProcessor
    include JSON::Serializable
    property json : String
  end

  struct HostDataElasticSwap
    include JSON::Serializable
    property total_in_bytes : Int64
  end

  struct HostDataElasticTransport
    include JSON::Serializable
    property bound_address : Hash(String, String)
    property profiles : Hash(String, String)
    property publish_address : String?
  end

  # Commons
  struct HostDataElasticJVMMemory
    include JSON::Serializable
    property direct_max_in_bytes : Int64?
    property heap_init_in_bytes : Int64?
    property heap_max_in_bytes : Int64?
    property non_heap_init_in_bytes : Int64?
    property non_heap_max_in_bytes : Int64?
    property heap_used_in_bytes : Int64?
  end

  struct HostDataElasticOsMemory
    include JSON::Serializable
    property free_in_bytes : Int64?
    property free_percent : Int64?
    property total_in_bytes : Int64?
    property used_in_bytes : Int64?
    property used_percent : Int64?
  end

  struct HostDataElasticProcess
    include JSON::Serializable
    property id : Int64?
    property max_file_descriptors : Int64?
    property mlockall : Bool?
    property refresh_interval_in_millis : Int64?
    property cpu : HostDataElasticCPULoad
    property open_file_descriptiors : HostDataElasticOpenFileDescriptiors?
  end

  # Index
  struct HostDataElasticIndex
    include JSON::Serializable
    property primaries : HostDataElasticIndexStats
    property total : HostDataElasticIndexStats
    property uuid : String?
  end

  struct HostDataElasticIndexStats
    include JSON::Serializable
    property indexing : HostDataElasticIndexing?
  end

  struct HostDataElasticIndexing
    include JSON::Serializable
    property delete_current : Int64
    property delete_time_in_millis : Int64
    property delete_total : Int64
    property index_current : Int64
    property index_failed : Int64?
    property index_total : Int64
    property index_time_in_millis : Int64?
    property is_throttled : Bool?
    property noop_update_total : Int64
    property throttle_time_in_millis : Int64
  end

  struct HostDataElasticCompletion
    include JSON::Serializable
    property size_in_bytes : Int64
  end

  struct HostDataElasticNodeCount
    include JSON::Serializable
    property client : Int64?
    property coordinating_only : Int64?
    property voting_only : Int64?
    property data : Int64?
    property data_only : Int64?
    property ingest : Int64?
    property master : Int64?
    property master_data : Int64?
    property master_only : Int64?
    property ml : Int64?
    property total : Int64?
  end

  struct HostDataElasticCPULoad
    include JSON::Serializable
    property percent : Int64
  end

  struct HostDataElasticCPUItem
    include JSON::Serializable
    property cache_size_in_bytes : Int64
    property cores_per_socket : Int64
    property count : Int64
    property mhz : Int64
    property model : Int64
    property total_cores : Int64
    property total_sockets : Int64
    property vendor : Int64
  end

  struct HostDataElasticIndexDocs
    include JSON::Serializable
    property count : Int64
    property deleted : Int64
  end

  struct HostDataElasticIndexFieldData
    include JSON::Serializable
    property evictions : Int64
    property memory_size_in_bytes : Int64
  end

  struct HostDataElasticFilterCache
    include JSON::Serializable
    property evictions : Int64
    property memory_size_in_bytes : Int64
  end

  struct HostDataElasticFS
    include JSON::Serializable
    property available_in_bytes : Int64?
    property disk_io_op : Int64?
    property disk_io_size_in_bytes : Int64?
    property disk_read_size_in_bytes : Int64?
    property disk_reads : Int64?
    property disk_write_size_in_bytes : Int64?
    property disk_writes : Int64?
    property free_in_bytes : Int64?
    property available_in_bytes : Int64?
    property disk_queue : String?
    property disk_service_time : String?
    property spins : String?
  end

  struct HostDataElasticIdCache
    include JSON::Serializable
    property memory_size_in_bytes : Int64
  end

  struct HostDataElasticShardIndex
    include JSON::Serializable
    property primaries : HostDataElasticIndexMetric
    property replication : HostDataElasticIndexMetric
    property shards : HostDataElasticIndexMetric
  end

  struct HostDataElasticIndexMetric
    include JSON::Serializable
    property avg : Float64
    property max : Float64
    property min : Float64
  end

  struct HostDataElasticIndices
    include JSON::Serializable
    property completion : HostDataElasticCompletion
    property count : Int64
    property docs : HostDataElasticIndexDocs
    property fielddata : HostDataElasticIndexFieldData
    property filter_cache : HostDataElasticFilterCache?
    property id_cache : HostDataElasticIdCache?
    property percolate : HostDataElasticPercolate?
    property query_cache : HostDataElasticQueryCache?
    property segments : HostDataElasticSegments
    property shards : HostDataElasticIndicesShards
    property store : HostDataElasticStore
  end

  struct HostDataElasticIndicesShards
    include JSON::Serializable
    property index : HostDataElasticShardIndex?
    property primaries : Int64?
    property replication : Float64?
    property total : Int64?
  end

  struct HostDataElasticJVMData
    include JSON::Serializable
    property max_uptime_in_millis : Int64
    property meme : HostDataElasticJVMMemory
    property threads : Int64
    property versions : Array(HostDataElasticJVMVersion)?
  end

  struct HostDataElasticJVMVersion
    include JSON::Serializable
    property count : Int64
    property vm_name : String
    property vm_vendor : String
    property vm_version : String
    property version : String
  end

  struct HostDataElasticOSName
    include JSON::Serializable
    property count : Int64
    property name : String?
  end

  struct HostDataElasticNetworkTypes
    include JSON::Serializable
    property http_types : Hash(String, Int64)
    property transport_types : Hash(String, Int64)
  end

  struct HostDataElasticNodes
    include JSON::Serializable
    property count : HostDataElasticNodeCount
    property fs : HostDataElasticFS
    property jvm : HostDataElasticJVM
    property network_types : HostDataElasticNetworkTypes
    property os : HostDataElasticOS
    property plugins : Array(HostDataElasticPlugin)?
    property process : HostDataElasticProcess
    property versions : Array(String)?
    property ingest : Array(String)?
    property packaging_types : Array(HostDataElasticPackagingType)?
    property discovery_types : Hash(String, String)?
  end

  struct HostDataElasticOpenFileDescriptiors
    include JSON::Serializable
    property avg : Int64
    property max : Int64
    property min : Int64
  end

  struct HostDataElasticOS
    include JSON::Serializable
    property allocated_processors : Int64?
    property available_processors : Int64?
    property cpu : Array(HostDataElasticCPUItem)?
    property mem : HostDataElasticOsMemory
    property names : Array(HostDataElasticOSName)?
    property pretty_names : Array(HostDataElasticPrettyName)?
  end

  struct HostDataElasticPercolate
    include JSON::Serializable
    property current : Int64
    property memory_size : String?
    property memory_size_in_bytes : Int64
    property queries : Int64
    property time_in_millis : Int64
    property total : Int64
  end

  struct HostDataElasticPrettyName
    include JSON::Serializable
    property count : Int64
    property pretty_name : String
  end

  struct HostDataElasticQueryCache
    include JSON::Serializable
    property cache_count : Int64
    property cache_size : Int64
    property evictions : Int64
    property hit_count : Int64
    property memory_size_in_bytes : Int64
    property miss_count : Int64
    property total_count : Int64
  end

  struct HostDataElasticSegments
    include JSON::Serializable
    property count : Int64
    property doc_values_memory_in_bytes : Int64?
    property fixed_bit_set_memory_in_bytes : Int64
    property index_writer_max_memory_in_bytes : Int64?
    property index_writer_memory_in_bytes : Int64
    property max_unsafe_auto_id_timestamp : Int64?
    property memory_in_bytes : Int64
    property norms_memory_in_bytes : Int64?
    property points_memory_in_bytes : Int64?
    property stored_fields_memory_in_bytes : Int64?
    property term_vectors_memory_in_bytes : Int64?
    property terms_memory_in_bytes : Int64?
    property terms_offheap_memory_in_bytes : Int64?
    property version_map_memory_in_bytes : Int64
    property file_sizes : Hash(String, String)
  end

  struct HostDataElasticStore
    include JSON::Serializable
    property size_in_bytes : Int64
    property throttle_time_in_millis : Int64
  end

  struct HostDataElasticPackagingType
    include JSON::Serializable
    property count : Int64
    property flavour : String
    property type : String
  end
end
