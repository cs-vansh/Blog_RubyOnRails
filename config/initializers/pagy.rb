# Pagy initializer

# Load Pagy and required extras
require "pagy"

# Include the frontend helper
require "pagy/extras/bootstrap"

# Set Pagy default options
Pagy::DEFAULT[:items] = 10        # Items per page
Pagy::DEFAULT[:size]  = [ 1, 4, 4, 1 ] # Nav bar links
# Other options: https://ddnexus.github.io/pagy/api/pagy#instance-variables
