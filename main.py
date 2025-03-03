#from animation import start_animation
class Idolgioitre:
    def __init__(self, name, age, appearance):
        self.name = name
        self.age = age
        self.__appearance = appearance #set private variable
    
    def getAppearance(seft): 
        return seft.__appearance #get variable
    
    def setAppearance(self, value):
        self.__appearance = value
        return f"{self.__appearance}"

class KhaBanh(Idolgioitre):
    def __init__(self, name, age, appearance, location):
        super().__init__(name, age, appearance)
        self.location = location
    def livestream(seft):
        pass

    def signnatureQuote(seft):
        print("Ao that day")

kh = KhaBanh("Ngo Ba Kha", 30, "Dau cat moi", "Trong tu")
print(kh.name)
print(kh.location)
kh.signnatureQuote()
#kh.appearance = "Toc nhu DB"
print(kh.getAppearance())
print(kh.setAppearance("Toc nhu DB"))

class TienBip(Idolgioitre):
    def livestream(seft):
        pass

    def signnatureQuote(seft):
        print("Con cai nit")

tb = TienBip("Ngo Ba Kha", 30, "Dau cat moi")
print(tb.name)
tb.signnatureQuote()