# lab5

# Treść polecenia do tworzenia obrazu przyjmując, że nazwa nie Dockerfile nie została zmieniona
docker build --build-arg VERSION=1.1.1 -t nazwa_obrazu .
![image](https://user-images.githubusercontent.com/84729968/229314049-5ee32357-433b-4159-b4bf-a1110068c5db.png)


# Polecenie uruchamiajace kontener
docker run -d -p 81:80 --name nazwa_kontenera nazwa_obrazu
![image](https://user-images.githubusercontent.com/84729968/229314060-a0f3ad4d-3b63-4919-90b1-449e01307ab2.png)


# Sprawdzenie (HEALTHCHECK)
docker ps
![image](https://user-images.githubusercontent.com/84729968/229314064-a4e839b4-b8db-46ce-a180-1e47d6eddb62.png)


# Sprawdzenie strony
curl 127.0.0.1:81/
![image](https://user-images.githubusercontent.com/84729968/229314068-a2b2f088-3a5b-4b24-b98d-dd8ec6ccf2c1.png)
