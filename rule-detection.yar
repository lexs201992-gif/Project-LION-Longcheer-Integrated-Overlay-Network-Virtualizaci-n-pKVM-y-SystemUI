rule Longcheer_LION_Sidebar_Listener {
    meta:
        description = "Detecta el listener de ScreenState y la inicialización de red del sidebar de Longcheer (Project LION)"
        author = "Alex de la Cruz (lexs201992-gif)"
        date = "2026-08-15"
        level = "critical"
        reference = "Project LION: Longcheer Integrated Overlay Network"

    strings:
        $s1_listener_class = "Lcom/longcheer/sidebar/listener/ScreenListener;" ascii
        $s2_receiver_class = "Lcom/longcheer/sidebar/listener/ScreenListener$ScreenBroadcastReceiver;" ascii
        $s3_intent_screen_on = "android.intent.action.SCREEN_ON" ascii
        $s4_intent_screen_off = "android.intent.action.SCREEN_OFF" ascii
        $s5_intent_user_present = "android.intent.action.USER_PRESENT" ascii
        
        $s6_wireguard_init = "WireGuard 1.0.0 loaded" ascii
        $s7_wg_interface = "tun0" ascii
        $s8_wg_peer = "fd00:" ascii wide // Prefijo IPv6 común en configuraciones WG privadas
        
        $s9_pmem_namespace = "namespace 0.0" ascii
        $s10_nd_pmem = "nd_pmem" ascii
        $s11_macsec = "macsec" ascii
        $s12_cdc_ncm = "cdc_ncm" ascii
        
        $s13_longcheer_fota = "fota.longcheer.com" ascii
        $s14_longcheer_sar = "com.longcheer.SarControl" ascii
        $s15_qogirl6 = "qogirl6" ascii // Codename de la placa base

    condition:
        // Se detecta si encuentra la clase del listener + al menos 2 indicadores de red/persistencia
        ($s1_listener_class or $s2_receiver_class) and 
        ($s3_intent_screen_on and $s4_intent_screen_off) and
        (
            ($s6_wireguard_init and $s7_wg_interface) or 
            ($s9_pmem_namespace and $s10_nd_pmem) or 
            ($s13_longcheer_fota) or 
            ($s15_qogirl6)
        )
}   
