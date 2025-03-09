#g++ src/main.cpp `pkg-config --cflags --libs opencv4` -std=c++20

CXX = clang++
#CXX = g++
#brewでのインストールバージョンを指定しgcc版を利用
#% g++-14 src/main.cpp `pkg-config --cflags --libs opencv4` 

# `pkg-config` を使って OpenCV のヘッダーファイルのパスを取得
PKG_CONFIG = pkg-config
OPENCV_CFLAGS = $(shell pkg-config --cflags opencv4)
#OPENCV_LIBS = $(shell pkg-config --libs opencv4)
OPENCV_LDPATH = $(shell pkg-config --libs-only-L opencv4)
OPENCV_LIBS   = $(shell pkg-config --libs-only-l opencv4)

#HOMEBREW_OPENCV = $(shell brew --prefix opencv)


# コンパイラ設定
CXXFLAGS += -std=c++20 -Wall
#  -I/usr/local/include/
CXXFLAGS +=$(OPENCV_CFLAGS)
#-Wall -Wextra -O2	

# libraries設定
LDFLAGS += $(OPENCV_LDPATH)
#-L/usr/local/lib 
# /opt/homebrew/Cellar/opencv/4.11.0_1/lib

LDLIBS += -lstdc++ -lm $(OPENCV_LIBS)
#  -lopencv_core -lopencv_highgui  -lopencv_imgcodecs 


TARGET = main
TESTDIR = tests

SRC_DIR = src
SRCS = $(shell find $(SRC_DIR) -type f -name "*.cpp")
# SRCS = $(wildcard $(SRC_DIR)/*.cpp)　#再帰探索は不可

OBJS = $(SRCS:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(LDLIBS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

echo:
	$(CXX) -v

.PHONY: all clean
