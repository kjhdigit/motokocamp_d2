import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Prim "mo:⛔";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Array "mo:base/Array";


actor {
// c1 

    public func nat_to_nat8(n : Nat) : async Nat8 {
        assert(n < 256);
        return (Prim.natToNat8(n));
    };

    // public func nat8_to_nat(n : Nat8) : async Nat {
    //     return(Nat8.toNat(n));
    // };


//c2 

    public func max_number_with_nbits(n : Nat) : async Nat {
        return (Nat.pow(2,n)-1);
    };


//c4 

     public func decimal_to_bits(n : Nat) : async Text{
        if (n==0) {return ("0")}
        else {
        var bits : Text = "";
        var dec: Nat = n;
        while (dec > 0){
        //   bits := Text.concat(Nat.toText(dec % 2), bits);
          bits := Nat.toText(dec % 2) # bits;
          dec := dec / 2;
        };
        return bits}
    };
  
//c5

    public func capitalize_character(c : Char) : async Char{
      var dec : Nat32 = Char.toNat32(c);
      if ((dec >= Char.toNat32('a')) and (dec <= Char.toNat32('z'))){
        dec := dec + Char.toNat32('A') - Char.toNat32('a') ;
        return Char.fromNat32(dec);
      } else{
        return (c);
      };
    };

//c6
  
    public func is_inside(t : Text, c: Char) : async Bool{
    for(char in Text.toIter(t)){
      if(c == char){
        return true;
      };
    };
    return false;
    };



// c7 

    public func trim_whitespace(t : Text) : async Text {
      var r : Text = "";
      for(char in Text.toIter(t)){
        if (char != ' '){
          r #= Text.fromChar(char);
        };
      };
      return r;
    };
  

//c8 
    // public func duplicated_character(t : Text) : async Text {
    //     var chars : Char = Iter.toArray(t.chars());
    //     var last_idx : Nat = chars.size() - 1;
    //     for (i in Iter.range(0, last_idx)) {
    //         for (j in Iter.range(i + 1, last_idx)) {
    //             if (Char.equal(chars[i], chars[j])) {
    //                 return Char.toText(chars[i]);
    //             };
    //         };
    //     };
    //     return t;
    // };

//c9 

    public func size_in_bytes(t : Text) : async Nat {
        return Text.encodeUtf8(t).size();
    };





	// Return the number of characters in the text
	public func number_characters(t : Text) : async Nat {
	    return(t.size());
	};


    //	Return the character corresponding to the unicode value n.
    public func unicode_to_character(n : Nat32) : async Text {
    	let char : Char = Char.fromNat32(n);
    	return(Char.toText(char));
    };

    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };

	public func test() : async Char {
		return('1');
	};

};

//c 10, not finished. 




// dfx deploy motokocamp_d2
// dfx canister call motokocamp_d2 nat_to_nat8 '(62)'
// dfx canister call motokocamp_d2 nat8_to_nat '(62)'
// dfx canister call motokocamp_d2 max_number_with_nbits '(62)'
// dfx canister call motokocamp_d2 decimal_to_bits '(62)'
// dfx canister call motokocamp_d2 capitalize_character '("32")' ,  error!!
// dfx canister call motokocamp_d2 is_inside '("world": text, "w": Char)' ,  
// dfx canister call motokocamp_d2 trim_whitespace '("wor ld")' ,  
// dfx canister call motokocamp_d2 size_in_bytes '("world" : text)' ,  




// dfx canister call motokocamp_d2 unicode_to_character '(62)'
// dfx canister call motokocamp_d2 unicode_to_character '(62)' <- Candid
// dfx canister call motokocamp_d2 test '()'
