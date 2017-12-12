require '../lib/RSA.rb'

RSpec.describe RSA do
	describe "specs for setting the value" do
		rsa = RSA.new(100, 500, 1000)

		it "checks if N is set correctly" do
			expect(rsa.n).to eq(100)
		end

		it "checks if E is set correctly" do
			expect(rsa.e).to eq(500)
		end

		it "checks if D is set correctly" do
			expect(rsa.d).to eq(1000)
		end
	end

	describe "specs for encrypting and decrypting a message" do
		context "specs inspired by Wikipedia's example" do
			rsa = RSA.new(3233, 17, 413)

			it "should encrypt and then decrypt with the set values" do
				expect(rsa.decrypt(rsa.encrypt("TUES"))).to eq("TUES")
			end

			it "should encrypt with the set values" do
				expect(rsa.encrypt("A")).to eq("2790") #"A" to ascii is 65

			end

			it "should decrypt with the set values" do
				expect(rsa.decrypt("2790")).to eq("A")

			end
		end

		context "specs with random generated values for n, e, d" do
			test = RSA.new(0,0,0)
			key = test.new_key
			rsa_random = RSA.new(key[0], key[1], key[2])

			it "should encrypt and then decrypt with the random generated values" do
				expect(rsa_random.decrypt(rsa_random.encrypt("TUES"))).to eq("TUES")
			end
		end
	end
end







