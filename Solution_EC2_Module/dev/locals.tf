locals {
    env = {
        dev = "dev"
        pre = "pre"
    }

    my_ip = "${chomp(data.http.myip.body)}/32"
}
