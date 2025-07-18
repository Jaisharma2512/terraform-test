fw = {
            vol1 = {
            network = "default"
            direction = "INGRESS"
            allow = [
                        {
                            protocol = "tcp"
                            ports = ["80"]
                        },
                        {

                            protocol: "tcp"
                            ports = ["22"]
                        }
                ]
            
            source_tags = ["dabba"]
            }

        }