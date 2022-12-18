const DEB = artifacts.require("DEB");
contract("DEB", accounts => {


    it("DEB", async () => {
        const deb = await DEB.deployed();

        const default_account = accounts[0];
        const donor_1 = accounts[1];
        const bjp = accounts[2];
        
        await deb.registerDonor({from: donor_1});
        await deb.registerParty("bjp", {from: bjp});
        console.log(`A doner and a party bjp are registered`);

        await deb.issueToken("1", {from: donor_1, value: 100});
        console.log(`A token is issued to donor_1`);

        await deb.transferToken(bjp, "0", {from: donor_1});
        console.log(`The token is transferred to bjp`);

        await deb.redeemToken("0", {from: bjp});
        console.log(`The token is redeemed by bjp`);


        return assert.isTrue(true);
    }); 

});