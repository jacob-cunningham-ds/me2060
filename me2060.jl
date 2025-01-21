module me2060

    # Export public functions
    export polygon_area, plot_polygon
    
    # Dependencies
    using Plots
    
    """
    `````{card} Docstring
    :header: `polygon_area`
    
    Calculate the area of a polygon by using the Shoelace Formula <wiki:Shoelace_formula>.
    
    The formula is given by:
    
    ```{math}
    \\begin{equation*}
      A = \\frac{1}{2} \\left | \\sum_{k=1}^{n}{x_k y_{k + 1} - x_{k + 1} y_k} \\right |
    \\end{equation*}
    ```
    
    ````{tab-set}
    ```{tab-item} Parameters
    - `x`: A 1D array of Catersian x-coordinates consisting of real numbers
    - `y`: A 1D array of Cartesian y-coordinates consisting of real numbers
    ```
    ```{tab-item} Returns
    - `area`: A real number representing the area of the polygon.
    ```
    ```{tab-item} Raises
    - TypeError:
        - If `x` is not a vector consisting of real numbers
        - If `y` is not a vector consisting of real numbers
    - ArgumentError:
        - If `x` and `y` are not one dimensional arrays
        - If `x` and `y` are not the same length
    ```
    ```{tab-item} Limitations
    - Does not account for intersecting geometries.
    ```
    ````
    
    ```{code} julia
    :filename: example
    using Printf
    import .me2060
    
    # coordinates representing a 1x1 square
    x = [0, 0, 1, 1]
    y = [0, 1, 1, 0]
    
    area = me2060.polygon_area(x, y)
    @printf("The area is %.2f: ", area)
    ```
    `````
    """
    function polygon_area(x::Vector{<:Real}, y::Vector{<:Real})
        # Check that x and y are 1D arrays
        if !(ndims(x) == 1 && ndims(y) == 1)
            throw(ArgumentError("x and y must be one dimensional arrays."))
        end
        
        # Check that x and y are the same length
        if !(length(x) == length(y))
            throw(ArgumentError("x and y must be arrays of the same length."))
        end
        
        # Concatenate the original array with the first element
        # and store as a new variable
        x_ext = reverse([x; x[1]]) # reverse so counter-clockwise
        y_ext = reverse([y; y[1]])
    
        # Get the length of the passed array for the stop point of the iterator
        n = length(x)
    
        # Create array of the elements of the summation
        v = [x_ext[k] * y_ext[k + 1] - x_ext[k + 1] * y_ext[k] for k in 1:n]
    
        # Sum the summation array and apply necessary constants
        area = 0.5 * abs(sum(v))
    
        return area
    end


    """
    `````{card} Docstring
    :header: `plot_polygon`
    
    Plot a polygon based on passed Cartesian coordinates.
    
    ````{tab-set}
    ```{tab-item} Parameters
    - `x`: A 1D array of Catersian x-coordinates consisting of real numbers
    - `y`: A 1D array of Cartesian y-coordinates consisting of real numbers
    ```
    ```{tab-item} Returns
    - Plot of the polygon in \$\\mathbb{R}^{2}\$
    ```
    ```{tab-item} Raises
    - TypeError:
        - If `x` is not a vector consisting of real numbers
        - If `y` is not a vector consisting of real numbers
    - ArgumentError:
        - If `x` and `y` are not one dimensional arrays
        - If `x` and `y` are not the same length
    ```
    ```{tab-item} Limitations
    - Limited to \$\\mathbb{R}^{2}\$
    ```
    ````
    
    ```{code} julia
    :filename: example
    import .me2060
    
    # coordinates representing a 1x1 square
    x = [0, 0, 1, 1]
    y = [0, 1, 1, 0]
    
    plot_polygon(x, y)
    ```
    `````
    """
    function plot_polygon(x::Vector{<:Real}, y::Vector{<:Real})
        # Check that x and y are 1D arrays
        if !(ndims(x) == 1 && ndims(y) == 1)
            throw(ArgumentError("x and y must be one dimensional arrays."))
        end
        
        # Check that x and y are the same length
        if !(length(x) == length(y))
            throw(ArgumentError("x and y must be arrays of the same length."))
        end
        
        # Concatenate the original array with the first element
        # and store as a new variable
        x_ext = reverse([x; x[1]]) # reverse so counter-clockwise
        y_ext = reverse([y; y[1]])

        # Plot the polygon
        plot(x_ext, y_ext, legend=false)
    end


    """
    `````{card} Docstring
    :header: `polygon_area`
    
    Calculate the area of a polygon by using the Shoelace Formula <wiki:Shoelace_formula>.
    
    The formula is given by:
    
    ```{math}
    \\begin{equation*}
      A = \\frac{1}{2} \\left | \\sum_{k=1}^{n}{x_k y_{k + 1} - x_{k + 1} y_k} \\right |
    \\end{equation*}
    ```
    
    ````{tab-set}
    ```{tab-item} Parameters
    - `x`: A 1D array of Catersian x-coordinates consisting of real numbers
    - `y`: A 1D array of Cartesian y-coordinates consisting of real numbers
    ```
    ```{tab-item} Returns
    - `area`: A real number representing the area of the polygon.
    ```
    ```{tab-item} Raises
    - TypeError:
        - If `x` is not a vector consisting of real numbers
        - If `y` is not a vector consisting of real numbers
    - ArgumentError:
        - If `x` and `y` are not one dimensional arrays
        - If `x` and `y` are not the same length
    ```
    ```{tab-item} Limitations
    - Does not account for intersecting geometries.
    ```
    ````
    
    ```{code} julia
    :filename: example
    using Printf
    import .me2060
    
    # coordinates representing a 1x1 square
    x = [0, 0, 1, 1]
    y = [0, 1, 1, 0]
    
    area = me2060.polygon_area(x, y)
    @printf("The area is %.2f: ", area)
    ```
    `````
    """
    function plot_taylor_series(x::Vector{<:Real}, y::Vector{<:Real}, a::Real, n::Integer)
        # Check that x and y are 1D arrays
        if !(ndims(x) == 1 && ndims(y) == 1)
            throw(ArgumentError("x and y must be one dimensional arrays."))
        end
        
        # Check that x and y are the same length
        if !(length(x) == length(y))
            throw(ArgumentError("x and y must be arrays of the same length."))
        end

        # Check that n is positive
        if !(n >= 0)
            throw(ArgumentError("n must be greater than or equal to 0."))
        end
        
        # 
end