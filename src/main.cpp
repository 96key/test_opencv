#include <iostream>


#include <opencv2/opencv.hpp>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui.hpp>



//using namespace cv;


int main()
{
    std::string str;

    std::cout << "hogehoge -- " << std::endl;
    // std::cin >> str;
    // std::cout << str << std::endl;
    
    std::string image_path = "img.png"; //"path/to/image";
    cv::Mat img = cv::imread(image_path, cv::IMREAD_COLOR);

    cv::imshow("Display window", img);
    int k = cv::waitKey(0); // Wait for a keystroke in the window


    
    return 0;
}
