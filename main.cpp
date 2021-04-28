#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <CvPlot/cvplot.h>
#include <iostream>

int main()
{
    CvPlot::Axes axes = CvPlot::plot(std::vector<double>{ 3, 4, 4, 6 }, "-o");
    CvPlot::Window window( "test 1", axes, 400, 400);
    cv::moveWindow("test 1", 300, 300);

    CvPlot::Axes axes2 = CvPlot::plot(std::vector<double>{ 5,4,3,1 }, "or");
    CvPlot::Window window2("test 2", axes2, 400, 400);
    cv::moveWindow("test 2", 750, 300);
    
    CvPlot::Window::waitKey({ &window,&window2 });

    return 0;
}
