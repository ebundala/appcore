import "package:dartson/dartson.dart";
import "../user/userState.dart" show userInfo;

@Entity()
class Category {
	String name;
	String catId;
	//Category({this.catId,this.name});
	Map<String,SubCategory> subCategories={};
	
}

@Entity()
class SubCategory extends Category {
	String parentId;
	String name;
	String catId;
	//SubCategory({this.parentId,catId,name}):super(catId:catId,name:name);
	
}

@Entity()
enum ItemCondition{
	brandNew,
	refurbished,
	secondHand,
	needRepair,
	unRepairable,
}

@Entity()
enum ItemType{
	physical,
	digital
}

@Entity()
enum SellMode{
	directSell,
	auctionSell
}



@Entity()
class AuctionInfo {
	String auctionId;
	int start;
	int end;
	bool status;
	Bid  highestBid;
	Bid  minimumBid;
	userInfo seller;
	ItemInfo item;
   //AuctionInfo({this.id,this.start,this.end});
}

@Entity()
class Auction extends AuctionInfo{
	
	String auctionId;
	int start;
	int end;
	bool status;
	Bid  highestBid;
	Bid  minimumBid;
	userInfo seller;
	ItemInfo item;
	//map usersid and their bids
	Map<String,Bid> bids={};
	//Auction({id,start,end}):super(id:id,start:start,end:end);
AuctionInfo getAuctionInfo(){
	return (new AuctionInfo()
		..auctionId=auctionId
		..item=item..seller=seller
		..start=start
    ..end=end
		..status=status
			..highestBid=highestBid
			..minimumBid=minimumBid
			..seller=seller
	);
}
	
}

@Entity()
 class ItemInfo{
	String itemId;
	userInfo seller;
	String title;
	double priceUnit;
  String featuredImage;
	//ItemInfo({this.itemId,this.title,this.priceUnit,this.seller});
}

@Entity()

class Item extends ItemInfo{
	String itemId;
	userInfo seller;
	String title;
	double priceUnit;

	int quantity;
	int quantitySold;
	String qUnits;
	var condition=ItemCondition.brandNew;
	var type=ItemType.physical;
	var mode=SellMode.directSell;
	String description;
	String featuredImage;
	List<String> additionalImages=[];
	Map<String,Category> categories={};
	Map<String,SubCategory> subCategories={};
	AuctionInfo auctionInfo;
	//Item({itemId,title,priceUnit,this.quantity,this.qUnits,seller}):super(itemId:itemId,title:title,priceUnit:priceUnit,seller:seller);
ItemInfo getItemInfo(){
  return (new ItemInfo()..seller=seller..itemId=itemId..title=title..priceUnit=priceUnit..featuredImage=featuredImage);
}
}



@Entity()
class Bid extends userInfo {
	double bidValue;
	ItemInfo item;
	String userName;
	String avator;
	String uid;
	String auctionId;

	//Bid({bidderId,bidderName,avator,this.item,this.bidValue}):super(uid:bidderId,name:bidderName,avator:avator);
	
}

@Entity()
enum OrderState{
	waiting,
	completed,
	canceled,
	delivered,
	returned,

}

@Entity()
class Order extends userInfo {
	OrderState status=OrderState.waiting;
	String orderId;
	//final userInfo user;
	Cart cart;
	String userName;
	String avator;
	String uid;

	//Order({this.orderId,this.cart,buyerId,buyerName,avator}):super(uid:buyerId,name:buyerName,avator:avator);


}

@Entity()
class CartItemInfo extends ItemInfo {
	String itemId;
	userInfo seller;
	String title;
	double priceUnit;
	int quantity=1;
	double subTotal;
	// CartItemInfo(itemId,title,priceUnit,this.quantity,seller):super(itemId:itemId,title:title,priceUnit:priceUnit,seller:seller){
	// 	subTotal=priceUnit*quantity;
	// }
}

@Entity()
class Cart extends userInfo {
	String userName;
	String avator;
	String uid;
	double grandTotal=0.0;
	Map<String,CartItemInfo> items={};
	String invoiceNo;
	//Cart(buyerUid,buyerName,buyerAvator,this.invoiceNo,this.items):super(uid:buyerUid,name:buyerName,avator:buyerAvator)
	
}

@Entity()
class Like {
	final bool status=true;
	String userId;
	String objectId;

}

@Entity()
class Unlike extends Like{
final bool status=false;
}

@Entity()
class Comment extends userInfo{
	String text;
	String commentId;
	String objectId;
	//
}

@Entity()
class Rating extends Comment {
	int value;
	
}

@Entity()
class ratings {
	String objectId;
	int averageRate;
	Map<String,Rating> rawData={};
	
}

@Entity()
class Report extends userInfo {
	String userName;
	String avator;
	String uid;
	final bool status=true;
}
@Entity()
class UnReport extends Report {
	String userName;
	String avator;
	String uid;
	final bool status=true;
}
@Entity()
class Abuse {
	String objectId;
	Map<String,Report> reports={};
	
}



