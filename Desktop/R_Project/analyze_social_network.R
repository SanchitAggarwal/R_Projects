require(Rfacebook)
require(Rook)
#fb_oauth <- fbOAuth(app_id="1450026395280539", app_secret="93be8b34169281ff5b246fa67e5216a0",extended_permissions = TRUE)
#save(fb_oauth, file="fb_oauth")
#load("fb_oauth")
# First we have to get an access_token for our connection.
token <- "CAACEdEose0cBAKR2bpPSfqJSFIleAxHEmjy4HCw7Is8Mis6BKy7NaLa4wMOXNvylO8p4FUamnj0SKUjFwnzUdx3LMdvhJLDJwRQYfFQTxZCyoKx08X6Lm8swaH8Tt9JqQhSi416v6SBPFgpRjx0qfXA05iXv2n3PwDGPpCrjrhRlVEQCvAW8p5rnTvbtC7SJDHnpklHD00cIBuH0B"
me <- getUsers("me",token=token,private_info=TRUE)
my_friends <- getFriends(token,simplify=FALSE)
my_friends_info <- getUsers(my_friends$id,token=token, private_info=TRUE)
my_network <- getNetwork(token, format="adj.matrix", verbose = TRUE)

# removed the singletons from the chart below to make it simpler, by excluding friends were friends with me but none of my other friends.

singletons <- rowSums(my_network)==0

# igraph package to draw my social network

require(igraph)
my_graph <- graph.adjacency(my_network[!singletons,!singletons])

# layout.drl - force-directed graph layout

layout <- layout.drl(my_graph,options=list(simmer.attraction=0))
plot(my_graph, vertex.size=2, 
     #vertex.label=NA, 
     vertex.label.cex=0.5,
     edge.arrow.size=0, edge.curved=TRUE,layout=layout)