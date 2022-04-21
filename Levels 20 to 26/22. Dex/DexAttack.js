/*
-------Variables declared for reusing----
tk1 = await contract.token1()
tk2 = await contract.token2()

-------Approve enough tokens for DEX contract address to swap-------
await contract.approve(contract.address, 200)

-------Swap tokens------------
await contract.swap(tk1, tk2, 10) or await contract.swap(tk2, tk1, 10)
await contract.swap(tk2, tk1, 20)
await contract.swap(tk1, tk2, 24)
await contract.swap(tk2, tk1, 30)
await contract.swap(tk1, tk2, 41)
await contract.swap(tk2, tk1, 45)

------Get token balances of DEX contract address--------------
(await contract.balanceOf(tk1, contract.address)).toString()
(await contract.balanceOf(tk2, contract.address)).toString()

------Helper for viewing the obtainable tokens in each swap----
(await contract.get_swap_price(tk2, tk1, 20)).toString()

------Helper for reviewing DEX contract's tokens balance----
(await contract.balanceOf(tk1, player)).toString()
(await contract.balanceOf(tk2, player)).toString()

*/