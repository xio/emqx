import Config

config :logger,
  backends: [:console],
  level: :debug,
  handle_otp_reports: true

config :sasl,
    sasl_error_logger: false

config :ekka,
    sname: :emqx,
    cluster_autoheal: true,
    cluster_autoclean: 300000,
    cluster_name: :emqxcl,
    cluster_enable: true,
    cluster_discovery: {:manual,[]}

config :gen_rpc,
    socket_keepalive_count: 9,
    socket_keepalive_interval: 75,
    socket_keepalive_idle: 900,
    call_receive_timeout: 15000,
    authentication_timeout: 5000,
    send_timeout: 5000,
    connect_timeout: 5000,
    tcp_client_port: 5369,
    tcp_server_port: 5369

config :emqx,
    mgmt_port: 8081,
    default_user_passwd: 'public',
    default_user_username: 'admin',
    max_row_limit: 10000,
    default_application_id: '',
    default_application_secret: '',
    route_batch_clean: false,
    shared_dispatch_ack_enabled: false,
    shared_subscription_strategy: :random,
    session_locking_strategy: :quorum,
    enable_session_registry: true,
    broker_sys_interval: 60000,
    expand_plugins_dir: 'plugins/',
    plugins_loaded_file: 'data/loaded_plugins',
    plugins_etc_dir: 'etc/plugins/',
    mqtt_ignore_loop_deliver: false,
    mqtt_shared_subscription: true,
    mqtt_wildcard_subscription: true,
    mqtt_retain_available: true,
    max_topic_alias: 0,
    max_qos_allowed: 2,
    max_topic_levels: 0,
    max_clientid_len: 65535,
    max_packet_size: 1048576,
    response_topic_prefix: 'emqxrspv1',
    acl_deny_action: :ignore,
    acl_cache_max_size: 32,
    acl_cache_ttl: 60000,
    enable_acl_cache: true,
    acl_file: 'etc/acl.conf',
    acl_nomatch: :allow,
    allow_anonymous: true,
    primary_log_level: :error,
    zones: [
        {:external,[
            use_username_as_clientid: false,
            upgrade_qos: false,
            session_expiry_interval: 7200,
            retry_interval: 20000,
            mqueue_store_qos0: true,
            mqueue_default_priority: :highest,
            max_subscriptions: 0,
            max_mqueue_len: 1000,
            max_inflight: 32,
            max_awaiting_rel: 100,
            keepalive_backoff: 0.75,
            idle_timeout: 15000,
            force_shutdown_policy: %{:max_heap_size => 0,:message_queue_len => 0},
            force_gc_policy: %{:bytes => 1048576,:count => 1000},
            enable_stats: true,
            enable_ban: true,
            enable_acl: true,
            await_rel_timeout: 300000,
            acl_deny_action: :ignore]},
        {:internal, [
            use_username_as_clientid: false,
            upgrade_qos: false,
            session_expiry_interval: 7200,
            retry_interval: 20000,
            mqueue_store_qos0: true,
            mqueue_default_priority: :lowest,
            max_subscriptions: 0,
            max_mqueue_len: 1000,
            max_inflight: 32,
            max_awaiting_rel: 100,
            keepalive_backoff: 0.75,
            idle_timeout: 15000,
            force_shutdown_policy: %{:max_heap_size => 0,:message_queue_len => 0},
            force_gc_policy: %{:bytes => 0,:count => 0},
            enable_stats: true,
            enable_ban: false,
            enable_acl: false,
            await_rel_timeout: 300000,
            allow_anonymous: true,
            acl_deny_action: :ignore]}
    ],
    modules: [{:emqx_mod_presence,[{:qos,1}]}],
    sysmon: [
        {:long_gc,false},
        {:long_schedule,240},
        {:large_heap,8388608},
        {:busy_port,false},
        {:busy_dist_port,true}
    ]

import_config "listeners.exs"
import_config "log.exs"