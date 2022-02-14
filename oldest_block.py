import web3

print("gimme node url")
HTTP = input()
provider = web3.HTTPProvider(HTTP)
client = web3.Web3(provider)
id = client.eth.block_number

while True:
    id -= 100
    res = client.eth.getBlock(id)
    print("The block number is [{}]".format(res["number"]))