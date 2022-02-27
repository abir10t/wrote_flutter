void main()
{
  
  var myMap = 
  {
    
    "name":"abir",
    "age":34,
    "city":"Shanghai",
    "address" : 
    [
      {
        "Country":"China",
        "City":"Shanghai",
      },
      {
        "Country":"Bangladesh",
        "City":"Dhaka"
      }
    ]
  };
  
  
  var obj = Person.fromJson(myMap);
 // print(obj.age);
  
  var myadresss = obj.address;
  
   myadresss!.map((e){
     print(e);
   }).toList();
  
}


class Person
{

  String? name;
  int?    age;
  String? city;
  List<Address>? address;
  
  Person({this.name, this.age, this.city, this.address});
  
  Person.fromJson(Map<String,  dynamic> json)
  {
    name = json['name'];
    age  = json['age'];
    city = json['city'];
    
    
    if( json['address']!= null)
    {
      address = <Address>[];
      (json['address'] as List).forEach((e){
        
        address!.add(Address.fromJson(e));
        
      });
    }
  }
  
}

class Address
{
  
  String? country;
  String? city;
  
  Address({this.country, this.city});
  
  Address.fromJson(Map<String,  dynamic> json)
  {
   
    country = json['country'];
    city    = json['city'];
  }
  
  
}
