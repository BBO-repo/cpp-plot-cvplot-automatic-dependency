# cpp-plot-cvplot-automatic-dependency
Automatically download, build and use OpenCV (with opencv-contrib) and CvPlot for C++ scientific plot application.

# How to use
clone the repo in your desired folder ex: cvdemo
> git clone https://github.com/BBO-repo/cpp-plot-cvplot-automatic-dependency.git CvPlotDemo</br>
> cd CvPlotDemo

run the cmake configuration to generate makefiles in the folder CvPlotDemo/build 
> cmake -S . -B build

run cmake to build your app
> cmake --build build --target all

That's it you're done! You can enjoy displaying wonderful graphics<br/><br/>
![image](https://user-images.githubusercontent.com/17410064/116364562-99e21c00-a804-11eb-8fde-b33b74702255.png)
![image](https://user-images.githubusercontent.com/17410064/116364606-abc3bf00-a804-11eb-8177-215dcfc800a3.png)


Notes: Downloading opencv and opencv-contrib may take some time.. fortunately you only do it once</br>
Comments: You could also using previous cmake commands
> mkdir build<br/>
> cd build<br/>
> cmake ..<br/>
> make

P.S: Building opencv may take some time .. you could increase number of threads
> cmake --build build --target all -j12

Or if using the previous cmake commands</br>
> ...</br>
> make -j12

