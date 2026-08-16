rule Unisoc_T606_Qogirl6_Overlay_Backdoor {
    meta:
        author = "Alexis Michel De La Cruz Correa"
        date = "2026-08-15"
        reference = "https://github.com/lexs201992-gif/motorola-g04s-t606-spreadtrum"
        description = "Detecta APK malicioso vendor overlay qogirl6 (12.34KB) firmado con CA Longcheer 2051 - Project Qogirl6"
        severity = "critical"
        mitre_attack = "T1195.002 (Supply Chain Compromise)"
        ioc_file = "unisoc_overlay_power_qogirl6.apk"
        ioc_size = "12636 bytes (approx 12.34 KB)"
        ioc_host = "sh-16-52.rnd.longcheer.net"
    
    strings:
        $apk_name = "unisoc_overlay_power_qogirl6" ascii wide
        $overlay_path = "vendor/overlay" ascii wide
        $cert1 = "CA Longcheer 2051" ascii wide
        $cert2 = "Longcheer" ascii wide
        $bootloader_id = "lion-2026-03-18_LOCAL" ascii wide
        $sipc1 = "sprd_sipc" ascii wide
        $sipc2 = "chan-4" ascii wide
        $sipc3 = "chan-5" ascii wide
        $tunnel_ip = "fd00:2" ascii wide
        $proc1 = "wcn_chr" ascii wide
        $proc2 = "linkturbonative" ascii wide
        $proc3 = "sprd_networkcontrol" ascii wide

    condition:
        (filesize > 10KB and filesize < 15KB and $apk_name) or
        (2 of ($cert*) and 1 of ($sipc*)) or
        ($apk_name and $overlay_path and 1 of ($proc*))
}   
