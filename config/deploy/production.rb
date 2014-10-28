server '54.186.243.105', user: 'ec2-user', roles: %w{web app}


# Global options
# --------------
set :ssh_options, {
 keys: %w(/home/barbara/AWS/aws-oregon-trampolim.pem)
}
