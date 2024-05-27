#include <Rcpp.h>
#include "mixbox.h"
#include <mixbox/mixbox.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
IntegerVector mixbox_blend(unsigned char r1,
                           unsigned char g1,
                           unsigned char b1,
                           unsigned char r2,
                           unsigned char g2,
                           unsigned char b2,
                           float t = 0.5) {
  // Output color
  unsigned char r, g, b;
  
  mixbox_lerp(r1, g1, b1, 
              r2, g2, b2, 
              t,
              &r, &g, &b);
  
  IntegerVector v = IntegerVector::create(r, g, b);
  v.attr("dim") = Dimension(1, 3);
  
  return v;
}

// [[Rcpp::export]]
NumericVector get_colors_to_mix(double x, NumericVector values) {
  
  if ((x > Rcpp::max(values)) | (x < Rcpp::min(values)))
    return NumericVector::create(NA_REAL, NA_REAL, NA_REAL);
  
  NumericVector v(3);
    
  for (int i = 0; i < values.length(); i++) {
    if ((x >= values[i]) & (x <= values[i+1])) {
      v[0] = i + 1;
      v[1] = i + 2;
      break;
    }
  }
  
  v[2] = (x - values[v[0]-1]) / (values[v[1]-1] - values[v[0]-1]);
    
  return v;
}