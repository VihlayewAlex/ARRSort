//
//  MergeSort.hpp
//  ARRSort
//
//  Created by Alex on 4/8/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#ifndef MergeSort_h
#define MergeSort_h

#ifdef __cplusplus
#include <iostream>
#include <utility>


#pragma mark - Class definition

class ArraySortManager {
    
private:
    
    #pragma mark - Merge Sort
    
    template <typename T>
    void merge(T arr[], size_t l, size_t m, size_t r);
    
    template <typename T>
    void mergeSort(T arr[], size_t l, size_t r);
    
    #pragma mark - Heap Sort
    
    template <typename T>
    void heapSort(T arr[], size_t n);
    
    template <typename T>
    void heapify(T arr[], size_t n, long i);
    
    #pragma mark - Quick Sort

    template <typename T>
    void quicksort(T *arr, const size_t left, const size_t right, const size_t sz);

    template <typename T>
    T partition(T *arr, const size_t left, const size_t right);

#pragma mark - Sorting algorithm wrapper

public:
    template <typename T>
    void mergesort_cpp(T* arrayPointer, size_t size) {
        ArraySortManager::mergeSort(arrayPointer, 0, size - 1);
    }
    
    template <typename T>
    void heapsort_cpp(T* arrayPointer, size_t size) {
        ArraySortManager::heapSort(arrayPointer, size);
    }
    
    template <typename T>
    void quicksort_cpp(T* arrayPointer, size_t size) {
        ArraySortManager::quicksort(arrayPointer, 0, size-1, size);
    }
    
};


#pragma mark - Algorithms implementation

// Merges two subarrays of arr[].
// First subarray is arr[l..m]
// Second subarray is arr[m+1..r]
template <typename T>
void ArraySortManager::merge(T arr[], size_t l, size_t m, size_t r) {
    size_t i, j, k;
    size_t n1 = m - l + 1;
    size_t n2 =  r - m;
    
    /* create temp arrays */
    T L[n1], R[n2];
    
    /* Copy data to temp arrays L[] and R[] */
    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1+ j];
    
    /* Merge the temp arrays back into arr[l..r]*/
    i = 0; // Initial index of first subarray
    j = 0; // Initial index of second subarray
    k = l; // Initial index of merged subarray
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        } else {
            arr[k] = R[j];
            j++;
        }
        k++;
    }
    
    /* Copy the remaining elements of L[], if there
     are any */
    while (i < n1) {
        arr[k] = L[i];
        i++;
        k++;
    }
    
    /* Copy the remaining elements of R[], if there
     are any */
    while (j < n2) {
        arr[k] = R[j];
        j++;
        k++;
    }
}

/* l is for left index and r is right index of the
 sub-array of arr to be sorted */
template <typename T>
void ArraySortManager::mergeSort(T arr[], size_t l, size_t r) {
    if (l < r) {
        // Same as (l+r)/2, but avoids overflow for
        // large l and h
        size_t m = l+(r-l)/2;
        
        // Sort first and second halves
        mergeSort(arr, l, m);
        mergeSort(arr, m+1, r);
        
        merge(arr, l, m, r);
    }
}





// main function to do heap sort
template <typename T>
void ArraySortManager::heapSort(T arr[], size_t n) {
    // Build heap (rearrange array)
    for (long i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);
    
    // One by one extract an element from heap
    for (long i=n-1; i>=0; i--)
    {
        // Move current root to end
        std::swap(arr[0], arr[i]);
        
        // call max heapify on the reduced heap
        heapify(arr, i, 0);
    }
}

// To heapify a subtree rooted with node i which is
// an index in arr[]. n is size of heap
template <typename T>
void ArraySortManager::heapify(T arr[], size_t n, long i) {
    long largest = i;  // Initialize largest as root
    long l = 2*i + 1;  // left = 2*i + 1
    long r = 2*i + 2;  // right = 2*i + 2
    
    // If left child is larger than root
    if (l < n && arr[l] > arr[largest])
        largest = l;
    
    // If right child is larger than largest so far
    if (r < n && arr[r] > arr[largest])
        largest = r;
    
    // If largest is not root
    if (largest != i)
    {
        std::swap(arr[i], arr[largest]);
        
        // Recursively heapify the affected sub-tree
        heapify(arr, n, largest);
    }
}





// quicksort
template<typename T>
T ArraySortManager::partition(T *arr, const size_t left, const size_t right) {
    const size_t mid = left + (right - left) / 2;
    const T pivot = arr[mid];
    // move the mid point value to the front.
    std::swap(arr[mid],arr[left]);
    size_t i = left + 1;
    size_t j = right;
    while (i <= j) {
        while(i <= j && arr[i] <= pivot) {
            i++;
        }

        while(i <= j && arr[j] > pivot) {
            j--;
        }

        if (i < j) {
            std::swap(arr[i], arr[j]);
        }
    }
    std::swap(arr[i - 1],arr[left]);
    return i - 1;
}

template <typename T>
void ArraySortManager::quicksort(T *arr, const size_t left, const size_t right, const size_t sz){

    if (left >= right) {
        return;
    }

    int part = partition(arr, left, right);

    quicksort(arr, left, part - 1, sz);
    quicksort(arr, part + 1, right, sz);
}




#endif

#endif /* MergeSort_h */
