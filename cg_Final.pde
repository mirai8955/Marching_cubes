float[][] gridvalue= new float[125000][8];
XYZ[][] xyz = new XYZ[125000][8];

 int[][] edgeTable = {
        {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 8, 9, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 2, 9, 10, -1, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 8, 9, 10, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 2, 8, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 9, 11, -1, -1, -1, -1, -1, -1, },
        {1, 2, 8, 9, 11, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 10, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 8, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {8, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 7, 8, 9, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 7, 9, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 4, 7, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 10, -1, -1, -1, -1, -1, },
        {0, 2, 4, 7, 8, 9, 10, -1, -1, -1, -1, -1, },
        {2, 3, 4, 7, 9, 10, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 7, 8, 11, -1, -1, -1, -1, -1, -1, },
        {0, 2, 4, 7, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 8, 9, 11, -1, -1, -1, },
        {1, 2, 4, 7, 9, 11, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 7, 8, 10, 11, -1, -1, -1, -1, -1, },
        {0, 1, 4, 7, 10, 11, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, 8, 9, 10, 11, -1, -1, -1, -1, },
        {4, 7, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {4, 5, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 5, 8, 9, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 5, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 5, 8, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 4, 5, 9, 10, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 5, 8, 9, 10, -1, -1, -1, },
        {0, 2, 4, 5, 10, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 5, 8, 10, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 5, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 2, 4, 5, 8, 9, 11, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 5, 11, -1, -1, -1, -1, -1, },
        {1, 2, 4, 5, 8, 11, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 5, 9, 10, 11, -1, -1, -1, -1, -1, },
        {0, 1, 4, 5, 8, 9, 10, 11, -1, -1, -1, -1, },
        {0, 3, 4, 5, 10, 11, -1, -1, -1, -1, -1, -1, },
        {4, 5, 8, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {7, 5, 8, 9, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 5, 9, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 7, 5, 8, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 7, 5, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 7, 5, 8, 9, 10, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 5, 9, 10, -1, -1, -1, -1, },
        {0, 2, 7, 5, 8, 10, -1, -1, -1, -1, -1, -1, },
        {2, 3, 7, 5, 10, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 7, 5, 8, 9, 11, -1, -1, -1, -1, -1, },
        {0, 2, 7, 5, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 5, 8, 11, -1, -1, -1, -1, },
        {1, 2, 7, 5, 11, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 7, 5, 8, 9, 10, 11, -1, -1, -1, -1, },
        {0, 1, 7, 5, 9, 10, 11, -1, -1, -1, -1, -1, },
        {0, 3, 7, 5, 8, 10, 11, -1, -1, -1, -1, -1, },
        {7, 5, 10, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {5, 6, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 5, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 1, 5, 6, 9, 10, -1, -1, -1, -1, -1, -1, },
        {1, 3, 5, 6, 8, 9, 10, -1, -1, -1, -1, -1, },
        {1, 2, 5, 6, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 5, 6, 8, -1, -1, -1, -1, -1, },
        {0, 2, 5, 6, 9, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 5, 6, 8, 9, -1, -1, -1, -1, -1, -1, },
        {2, 3, 5, 6, 10, 11, -1, -1, -1, -1, -1, -1, },
        {0, 2, 5, 6, 8, 10, 11, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 5, 6, 9, 10, 11, -1, -1, -1, },
        {1, 2, 5, 6, 8, 9, 10, 11, -1, -1, -1, -1, },
        {1, 3, 5, 6, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 5, 6, 8, 11, -1, -1, -1, -1, -1, -1, },
        {0, 3, 5, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {5, 6, 8, 9, 11, -1, -1, -1, -1, -1, -1, -1, },
        {4, 7, 5, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, 5, 6, 10, -1, -1, -1, -1, -1, },
        {0, 1, 4, 7, 5, 6, 8, 9, 10, -1, -1, -1, },
        {1, 3, 4, 7, 5, 6, 9, 10, -1, -1, -1, -1, },
        {1, 2, 4, 7, 5, 6, 8, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 5, 6, -1, -1, -1, -1, },
        {0, 2, 4, 7, 5, 6, 8, 9, -1, -1, -1, -1, },
        {2, 3, 4, 7, 5, 6, 9, -1, -1, -1, -1, -1, },
        {2, 3, 4, 7, 5, 6, 8, 10, 11, -1, -1, -1, },
        {0, 2, 4, 7, 5, 6, 10, 11, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 5, 6, 8, 9, 10, 11, },
        {1, 2, 4, 7, 5, 6, 9, 10, 11, -1, -1, -1, },
        {1, 3, 4, 7, 5, 6, 8, 11, -1, -1, -1, -1, },
        {0, 1, 4, 7, 5, 6, 11, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, 5, 6, 8, 9, 11, -1, -1, -1, },
        {4, 7, 5, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {4, 6, 9, 10, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 6, 8, 9, 10, -1, -1, -1, -1, -1, },
        {0, 1, 4, 6, 10, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {1, 2, 4, 6, 9, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 6, 8, 9, -1, -1, -1, -1, },
        {0, 2, 4, 6, -1, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 6, 8, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 6, 9, 10, 11, -1, -1, -1, -1, -1, },
        {0, 2, 4, 6, 8, 9, 10, 11, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 6, 10, 11, -1, -1, -1, -1, },
        {1, 2, 4, 6, 8, 10, 11, -1, -1, -1, -1, -1, },
        {1, 3, 4, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 6, 8, 9, 11, -1, -1, -1, -1, -1, },
        {0, 3, 4, 6, 11, -1, -1, -1, -1, -1, -1, -1, },
        {4, 6, 8, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {7, 6, 8, 9, 10, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 6, 9, 10, -1, -1, -1, -1, -1, -1, },
        {0, 1, 7, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {1, 3, 7, 6, 10, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 7, 6, 8, 9, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 6, 9, -1, -1, -1, -1, -1, },
        {0, 2, 7, 6, 8, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 7, 6, -1, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 7, 6, 8, 9, 10, 11, -1, -1, -1, -1, },
        {0, 2, 7, 6, 9, 10, 11, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 6, 8, 10, 11, -1, -1, -1, },
        {1, 2, 7, 6, 10, 11, -1, -1, -1, -1, -1, -1, },
        {1, 3, 7, 6, 8, 9, 11, -1, -1, -1, -1, -1, },
        {0, 1, 7, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 6, 8, 11, -1, -1, -1, -1, -1, -1, },
        {7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 6, 8, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 7, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {1, 3, 7, 6, 8, 9, 11, -1, -1, -1, -1, -1, },
        {1, 2, 7, 6, 10, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 6, 8, 10, 11, -1, -1, -1, },
        {0, 2, 7, 6, 9, 10, 11, -1, -1, -1, -1, -1, },
        {2, 3, 7, 6, 8, 9, 10, 11, -1, -1, -1, -1, },
        {2, 3, 7, 6, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 2, 7, 6, 8, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 6, 9, -1, -1, -1, -1, -1, },
        {1, 2, 7, 6, 8, 9, -1, -1, -1, -1, -1, -1, },
        {1, 3, 7, 6, 10, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 7, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 6, 9, 10, -1, -1, -1, -1, -1, -1, },
        {7, 6, 8, 9, 10, -1, -1, -1, -1, -1, -1, -1, },
        {4, 6, 8, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 6, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 6, 8, 9, 11, -1, -1, -1, -1, -1, },
        {1, 3, 4, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {1, 2, 4, 6, 8, 10, 11, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 6, 10, 11, -1, -1, -1, -1, },
        {0, 2, 4, 6, 8, 9, 10, 11, -1, -1, -1, -1, },
        {2, 3, 4, 6, 9, 10, 11, -1, -1, -1, -1, -1, },
        {2, 3, 4, 6, 8, -1, -1, -1, -1, -1, -1, -1, },
        {0, 2, 4, 6, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 6, 8, 9, -1, -1, -1, -1, },
        {1, 2, 4, 6, 9, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 6, 10, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 6, 8, 9, 10, -1, -1, -1, -1, -1, },
        {4, 6, 9, 10, -1, -1, -1, -1, -1, -1, -1, -1, },
        {4, 7, 5, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, 5, 6, 8, 9, 11, -1, -1, -1, },
        {0, 1, 4, 7, 5, 6, 11, -1, -1, -1, -1, -1, },
        {1, 3, 4, 7, 5, 6, 8, 11, -1, -1, -1, -1, },
        {1, 2, 4, 7, 5, 6, 9, 10, 11, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 5, 6, 8, 9, 10, 11, },
        {0, 2, 4, 7, 5, 6, 10, 11, -1, -1, -1, -1, },
        {2, 3, 4, 7, 5, 6, 8, 10, 11, -1, -1, -1, },
        {2, 3, 4, 7, 5, 6, 9, -1, -1, -1, -1, -1, },
        {0, 2, 4, 7, 5, 6, 8, 9, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 5, 6, -1, -1, -1, -1, },
        {1, 2, 4, 7, 5, 6, 8, -1, -1, -1, -1, -1, },
        {1, 3, 4, 7, 5, 6, 9, 10, -1, -1, -1, -1, },
        {0, 1, 4, 7, 5, 6, 8, 9, 10, -1, -1, -1, },
        {0, 3, 4, 7, 5, 6, 10, -1, -1, -1, -1, -1, },
        {4, 7, 5, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {5, 6, 8, 9, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 5, 6, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 5, 6, 8, 11, -1, -1, -1, -1, -1, -1, },
        {1, 3, 5, 6, 11, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 5, 6, 8, 9, 10, 11, -1, -1, -1, -1, },
        {0, 1, 2, 3, 5, 6, 9, 10, 11, -1, -1, -1, },
        {0, 2, 5, 6, 8, 10, 11, -1, -1, -1, -1, -1, },
        {2, 3, 5, 6, 10, 11, -1, -1, -1, -1, -1, -1, },
        {2, 3, 5, 6, 8, 9, -1, -1, -1, -1, -1, -1, },
        {0, 2, 5, 6, 9, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 5, 6, 8, -1, -1, -1, -1, -1, },
        {1, 2, 5, 6, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 5, 6, 8, 9, 10, -1, -1, -1, -1, -1, },
        {0, 1, 5, 6, 9, 10, -1, -1, -1, -1, -1, -1, },
        {0, 3, 5, 6, 8, 10, -1, -1, -1, -1, -1, -1, },
        {5, 6, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {7, 5, 10, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 5, 8, 10, 11, -1, -1, -1, -1, -1, },
        {0, 1, 7, 5, 9, 10, 11, -1, -1, -1, -1, -1, },
        {1, 3, 7, 5, 8, 9, 10, 11, -1, -1, -1, -1, },
        {1, 2, 7, 5, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 5, 8, 11, -1, -1, -1, -1, },
        {0, 2, 7, 5, 9, 11, -1, -1, -1, -1, -1, -1, },
        {2, 3, 7, 5, 8, 9, 11, -1, -1, -1, -1, -1, },
        {2, 3, 7, 5, 10, -1, -1, -1, -1, -1, -1, -1, },
        {0, 2, 7, 5, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 7, 5, 9, 10, -1, -1, -1, -1, },
        {1, 2, 7, 5, 8, 9, 10, -1, -1, -1, -1, -1, },
        {1, 3, 7, 5, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 7, 5, 8, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 7, 5, 9, -1, -1, -1, -1, -1, -1, -1, },
        {7, 5, 8, 9, -1, -1, -1, -1, -1, -1, -1, -1, },
        {4, 5, 8, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 5, 10, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 5, 8, 9, 10, 11, -1, -1, -1, -1, },
        {1, 3, 4, 5, 9, 10, 11, -1, -1, -1, -1, -1, },
        {1, 2, 4, 5, 8, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 5, 11, -1, -1, -1, -1, -1, },
        {0, 2, 4, 5, 8, 9, 11, -1, -1, -1, -1, -1, },
        {2, 3, 4, 5, 9, 11, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 5, 8, 10, -1, -1, -1, -1, -1, -1, },
        {0, 2, 4, 5, 10, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 5, 8, 9, 10, -1, -1, -1, },
        {1, 2, 4, 5, 9, 10, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 5, 8, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 5, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 5, 8, 9, -1, -1, -1, -1, -1, -1, },
        {4, 5, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {4, 7, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, 8, 9, 10, 11, -1, -1, -1, -1, },
        {0, 1, 4, 7, 10, 11, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 7, 8, 10, 11, -1, -1, -1, -1, -1, },
        {1, 2, 4, 7, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 8, 9, 11, -1, -1, -1, },
        {0, 2, 4, 7, 11, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 7, 8, 11, -1, -1, -1, -1, -1, -1, },
        {2, 3, 4, 7, 9, 10, -1, -1, -1, -1, -1, -1, },
        {0, 2, 4, 7, 8, 9, 10, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 4, 7, 10, -1, -1, -1, -1, -1, },
        {1, 2, 4, 7, 8, 10, -1, -1, -1, -1, -1, -1, },
        {1, 3, 4, 7, 9, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 4, 7, 8, 9, -1, -1, -1, -1, -1, -1, },
        {0, 3, 4, 7, -1, -1, -1, -1, -1, -1, -1, -1, },
        {4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {8, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 8, 10, 11, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 10, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 2, 8, 9, 11, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 9, 11, -1, -1, -1, -1, -1, -1, },
        {0, 2, 8, 11, -1, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {2, 3, 8, 9, 10, -1, -1, -1, -1, -1, -1, -1, },
        {0, 2, 9, 10, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 2, 3, 8, 10, -1, -1, -1, -1, -1, -1, },
        {1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {1, 3, 8, 9, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {0, 3, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
        {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, },
    };


    int[][] triTable = {
      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {3, 0, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {0, 1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {1, 9, 8, 1, 8, 3, -1, -1, -1, -1, -1, -1, -1},
      {1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {1, 2, 10, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {2, 10, 9, 2, 9, 0, -1, -1, -1, -1, -1, -1, -1},
      {2, 10, 9, 2, 9, 8, 2, 8, 3, -1, -1, -1, -1},
      {2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {11, 2, 0, 11, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {2, 3, 11, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {11, 2, 1, 11, 1, 9, 11, 9, 8, -1, -1, -1, -1},
      {3, 11, 10, 3, 10, 1, -1, -1, -1, -1, -1, -1, -1},
      {11, 10, 1, 11, 1, 0, 11, 0, 8, -1, -1, -1, -1},
      {3, 11, 10, 3, 10, 9, 3, 9, 0, -1, -1, -1, -1},
      {11, 10, 9, 11, 9, 8, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 0, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 8, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 1, 4, 1, 9, -1, -1, -1, -1},
      {4, 7, 8, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 0, 1, 2, 10, -1, -1, -1, -1},
      {4, 7, 8, 2, 10, 9, 2, 9, 0, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 2, 4, 2, 10, 4, 10, 9, -1},
      {4, 7, 8, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 11, 4, 11, 2, 4, 2, 0, -1, -1, -1, -1},
      {4, 7, 8, 0, 1, 9, 2, 3, 11, -1, -1, -1, -1},
      {4, 7, 11, 4, 11, 2, 4, 2, 1, 4, 1, 9, -1},
      {4, 7, 8, 3, 11, 10, 3, 10, 1, -1, -1, -1, -1},
      {4, 7, 11, 4, 11, 10, 4, 10, 1, 4, 1, 0, -1},
      {4, 7, 8, 3, 11, 10, 3, 10, 9, 3, 9, 0, -1},
      {11, 7, 4, 11, 4, 9, 11, 9, 10, -1, -1, -1, -1},
      {5, 4, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 9, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 0, 5, 0, 1, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 8, 5, 8, 3, 5, 3, 1, -1, -1, -1, -1},
      {5, 4, 9, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 9, 3, 0, 8, 1, 2, 10, -1, -1, -1, -1},
      {5, 4, 0, 5, 0, 2, 5, 2, 10, -1, -1, -1, -1},
      {5, 4, 8, 5, 8, 3, 5, 3, 2, 5, 2, 10, -1},
      {5, 4, 9, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 9, 11, 2, 0, 11, 0, 8, -1, -1, -1, -1},
      {5, 4, 0, 5, 0, 1, 2, 3, 11, -1, -1, -1, -1},
      {5, 4, 8, 5, 8, 11, 5, 11, 2, 5, 2, 1, -1},
      {5, 4, 9, 3, 11, 10, 3, 10, 1, -1, -1, -1, -1},
      {5, 4, 9, 11, 10, 1, 11, 1, 0, 11, 0, 8, -1},
      {5, 4, 0, 5, 0, 3, 5, 3, 11, 5, 11, 10, -1},
      {5, 10, 11, 5, 11, 8, 5, 8, 4, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 8, -1, -1, -1, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 3, 9, 3, 0, -1, -1, -1, -1},
      {5, 7, 8, 5, 8, 0, 5, 0, 1, -1, -1, -1, -1},
      {5, 7, 3, 5, 3, 1, -1, -1, -1, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 8, 1, 2, 10, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 3, 9, 3, 0, 1, 2, 10, -1},
      {5, 7, 8, 5, 8, 0, 5, 0, 2, 5, 2, 10, -1},
      {7, 5, 10, 7, 10, 2, 7, 2, 3, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 8, 2, 3, 11, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 11, 9, 11, 2, 9, 2, 0, -1},
      {5, 7, 8, 5, 8, 0, 5, 0, 1, 2, 3, 11, -1},
      {11, 7, 5, 11, 5, 1, 11, 1, 2, -1, -1, -1,-1 },
      {9, 5, 7, 9, 7, 8, 3, 11, 10, 3, 10, 1, -1},
      {11, 7, 5, 11, 5, 10, 0, 1, 9, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 10, 3, 0, 8, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 10, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 1, 9, 8, 1, 8, 3, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 2, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 2, 3, 0, 8, -1, -1, -1, -1},
      {6, 5, 9, 6, 9, 0, 6, 0, 2, -1, -1, -1, -1},
      {6, 5, 9, 6, 9, 8, 6, 8, 3, 6, 3, 2, -1},
      {6, 5, 10, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 11, 2, 0, 11, 0, 8, -1, -1, -1, -1},
      {6, 5, 10, 0, 1, 9, 2, 3, 11, -1, -1, -1, -1},
      {6, 5, 10, 11, 2, 1, 11, 1, 9, 11, 9, 8, -1},
      {6, 5, 1, 6, 1, 3, 6, 3, 11, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 0, 6, 0, 8, 6, 8, 11, -1},
      {6, 5, 9, 6, 9, 0, 6, 0, 3, 6, 3, 11, -1},
      {6, 11, 8, 6, 8, 9, 6, 9, 5, -1, -1, -1, -1},
      {6, 5, 10, 4, 7, 8, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 4, 7, 3, 4, 3, 0, -1, -1, -1, -1},
      {6, 5, 10, 0, 1, 9, 4, 7, 8, -1, -1, -1, -1},
      {6, 5, 10, 4, 7, 3, 4, 3, 1, 4, 1, 9, -1},
      {6, 5, 1, 6, 1, 2, 4, 7, 8, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 2, 4, 7, 3, 4, 3, 0, -1},
      {6, 5, 9, 6, 9, 0, 6, 0, 2, 4, 7, 8, -1},
      {7, 6, 2, 7, 2, 3, 5, 4, 9, -1, -1, -1, -1},
      {6, 5, 10, 2, 3, 11, 4, 7, 8, -1, -1, -1, -1},
      {6, 5, 10, 4, 7, 11, 4, 11, 2, 4, 2, 0, -1},
      {6, 5, 10, 2, 3, 11, 0, 1, 9, 4, 7, 8, -1},
      {7, 6, 11, 1, 2, 10, 5, 4, 9, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 3, 6, 3, 11, 4, 7, 8, -1},
      {7, 6, 11, 5, 4, 0, 5, 0, 1, -1, -1, -1, -1},
      {7, 6, 11, 3, 0, 8, 5, 4, 9, -1, -1, -1, -1},
      {7, 6, 11, 5, 4, 9, -1, -1, -1, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 9, -1, -1, -1, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 9, 3, 0, 8, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 0, 10, 0, 1, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 8, 10, 8, 3, 10, 3, 1, -1},
      {6, 4, 9, 6, 9, 1, 6, 1, 2, -1, -1, -1, -1},
      {6, 4, 9, 6, 9, 1, 6, 1, 2, 3, 0, 8, -1},
      {6, 4, 0, 6, 0, 2, -1, -1, -1, -1, -1, -1, -1},
      {8, 4, 6, 8, 6, 2, 8, 2, 3, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 9, 2, 3, 11, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 9, 11, 2, 0, 11, 0, 8, -1},
      {10, 6, 4, 10, 4, 0, 10, 0, 1, 2, 3, 11, -1},
      {6, 11, 8, 6, 8, 4, 1, 2, 10, -1, -1, -1, -1},
      {6, 4, 9, 6, 9, 1, 6, 1, 3, 6, 3, 11, -1},
      {6, 11, 8, 6, 8, 4, 0, 1, 9, -1, -1, -1, -1},
      {6, 11, 3, 6, 3, 0, 6, 0, 4, -1, -1, -1, -1},
      {6, 11, 8, 6, 8, 4, -1, -1, -1, -1, -1, -1, -1},
      {10, 6, 7, 10, 7, 8, 10, 8, 9, -1, -1, -1, -1},
      {10, 6, 7, 10, 7, 3, 10, 3, 0, 10, 0, 9, -1},
      {10, 6, 7, 10, 7, 8, 10, 8, 0, 10, 0, 1, -1},
      {7, 6, 10, 7, 10, 1, 7, 1, 3, -1, -1, -1, -1},
      {6, 7, 8, 6, 8, 9, 6, 9, 1, 6, 1, 2, -1},
      {7, 6, 2, 7, 2, 3, 0, 1, 9, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 0, 7, 0, 8, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 3, -1, -1, -1, -1, -1, -1, -1},
      {10, 6, 7, 10, 7, 8, 10, 8, 9, 2, 3, 11, -1},
      {7, 6, 11, 2, 10, 9, 2, 9, 0, -1, -1, -1, -1},
      {7, 6, 11, 3, 0, 8, 1, 2, 10, -1, -1, -1, -1},
      {7, 6, 11, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 1, 9, 8, 1, 8, 3, -1, -1, -1, -1},
      {7, 6, 11, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 1, 9, 8, 1, 8, 3, -1, -1, -1, -1},
      {7, 6, 11, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 3, 0, 8, 1, 2, 10, -1, -1, -1, -1},
      {7, 6, 11, 2, 10, 9, 2, 9, 0, -1, -1, -1, -1},
      {7, 6, 11, 2, 10, 9, 2, 9, 8, 2, 8, 3, -1},
      {7, 6, 2, 7, 2, 3, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 0, 7, 0, 8, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 3, 0, 1, 9, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 1, 7, 1, 9, 7, 9, 8, -1},
      {7, 6, 10, 7, 10, 1, 7, 1, 3, -1, -1, -1, -1},
      {7, 6, 10, 7, 10, 1, 7, 1, 0, 7, 0, 8, -1},
      {7, 6, 10, 7, 10, 9, 7, 9, 0, 7, 0, 3, -1},
      {10, 6, 7, 10, 7, 8, 10, 8, 9, -1, -1, -1, -1},
      {6, 11, 8, 6, 8, 4, -1, -1, -1, -1, -1, -1, -1},
      {6, 11, 3, 6, 3, 0, 6, 0, 4, -1, -1, -1, -1},
      {6, 11, 8, 6, 8, 4, 0, 1, 9, -1, -1, -1, -1},
      {6, 11, 3, 6, 3, 1, 6, 1, 9, 6, 9, 4, -1},
      {6, 11, 8, 6, 8, 4, 1, 2, 10, -1, -1, -1, -1},
      {6, 11, 3, 6, 3, 0, 6, 0, 4, 1, 2, 10, -1},
      {6, 11, 8, 6, 8, 4, 2, 10, 9, 2, 9, 0, -1},
      {10, 6, 4, 10, 4, 9, 2, 3, 11, -1, -1, -1, -1},
      {8, 4, 6, 8, 6, 2, 8, 2, 3, -1, -1, -1, -1},
      {6, 2, 0, 6, 0, 4, -1, -1, -1, -1, -1, -1, -1},
      {8, 4, 6, 8, 6, 2, 8, 2, 3, 0, 1, 9, -1},
      {6, 4, 9, 6, 9, 1, 6, 1, 2, -1, -1, -1, -1},
      {8, 4, 6, 8, 6, 10, 8, 10, 1, 8, 1, 3, -1},
      {10, 6, 4, 10, 4, 0, 10, 0, 1, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 9, 3, 0, 8, -1, -1, -1, -1},
      {10, 6, 4, 10, 4, 9, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 5, 4, 9, -1, -1, -1, -1, -1, -1, -1},
      {7, 6, 11, 3, 0, 8, 5, 4, 9, -1, -1, -1, -1},
      {7, 6, 11, 5, 4, 0, 5, 0, 1, -1, -1, -1, -1},
      {7, 6, 11, 5, 4, 8, 5, 8, 3, 5, 3, 1, -1},
      {7, 6, 11, 1, 2, 10, 5, 4, 9, -1, -1, -1, -1},
      {7, 6, 11, 1, 2, 10, 3, 0, 8, 5, 4, 9, -1},
      {7, 6, 11, 5, 4, 0, 5, 0, 2, 5, 2, 10, -1},
      {6, 5, 10, 2, 3, 11, 4, 7, 8, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 3, 5, 4, 9, -1, -1, -1, -1},
      {7, 6, 2, 7, 2, 0, 7, 0, 8, 5, 4, 9, -1},
      {7, 6, 2, 7, 2, 3, 5, 4, 0, 5, 0, 1, -1},
      {6, 5, 1, 6, 1, 2, 4, 7, 8, -1, -1, -1, -1},
      {7, 6, 10, 7, 10, 1, 7, 1, 3, 5, 4, 9, -1},
      {6, 5, 10, 0, 1, 9, 4, 7, 8, -1, -1, -1, -1},
      {6, 5, 10, 4, 7, 3, 4, 3, 0, -1, -1, -1, -1},
      {6, 5, 10, 4, 7, 8, -1, -1, -1, -1, -1, -1, -1},
      {6, 11, 8, 6, 8, 9, 6, 9, 5, -1, -1, -1, -1},
      {6, 11, 3, 6, 3, 0, 6, 0, 9, 6, 9, 5, -1},
      {6, 11, 8, 6, 8, 0, 6, 0, 1, 6, 1, 5, -1},
      {6, 5, 1, 6, 1, 3, 6, 3, 11, -1, -1, -1, -1},
      {6, 11, 8, 6, 8, 9, 6, 9, 5, 1, 2, 10, -1},
      {6, 5, 10, 0, 1, 9, 2, 3, 11, -1, -1, -1, -1},
      {6, 5, 10, 11, 2, 0, 11, 0, 8, -1, -1, -1, -1},
      {6, 5, 10, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
      {8, 9, 5, 8, 5, 6, 8, 6, 2, 8, 2, 3, -1},
      {6, 5, 9, 6, 9, 0, 6, 0, 2, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 2, 3, 0, 8, -1, -1, -1, -1},
      {6, 5, 1, 6, 1, 2, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 1, 9, 8, 1, 8, 3, -1, -1, -1, -1},
      {6, 5, 10, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {6, 5, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 10, -1, -1, -1, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 10, 3, 0, 8, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 10, 0, 1, 9, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 10, 1, 9, 8, 1, 8, 3, -1},
      {11, 7, 5, 11, 5, 1, 11, 1, 2, -1, -1, -1, -1},
      {11, 7, 5, 11, 5, 1, 11, 1, 2, 3, 0, 8, -1},
      {11, 7, 5, 11, 5, 9, 11, 9, 0, 11, 0, 2, -1},
      {9, 5, 7, 9, 7, 8, 2, 3, 11, -1, -1, -1, -1},
      {7, 5, 10, 7, 10, 2, 7, 2, 3, -1, -1, -1, -1},
      {7, 5, 10, 7, 10, 2, 7, 2, 0, 7, 0, 8, -1},
      {7, 5, 10, 7, 10, 2, 7, 2, 3, 0, 1, 9, -1},
      {9, 5, 7, 9, 7, 8, 1, 2, 10, -1, -1, -1, -1},
      {7, 5, 1, 7, 1, 3, -1, -1, -1, -1, -1, -1, -1},
      {5, 7, 8, 5, 8, 0, 5, 0, 1, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 3, 9, 3, 0, -1, -1, -1, -1},
      {9, 5, 7, 9, 7, 8, -1, -1, -1, -1, -1, -1, -1},
      {5, 10, 11, 5, 11, 8, 5, 8, 4, -1, -1, -1, -1},
      {5, 10, 11, 5, 11, 3, 5, 3, 0, 5, 0, 4, -1},
      {5, 10, 11, 5, 11, 8, 5, 8, 4, 0, 1, 9, -1},
      {5, 4, 9, 3, 11, 10, 3, 10, 1, -1, -1, -1, -1},
      {5, 1, 2, 5, 2, 11, 5, 11, 8, 5, 8, 4, -1},
      {5, 4, 0, 5, 0, 1, 2, 3, 11, -1, -1, -1, -1},
      {5, 4, 9, 11, 2, 0, 11, 0, 8, -1, -1, -1, -1},
      {5, 4, 9, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
      {5, 10, 2, 5, 2, 3, 5, 3, 8, 5, 8, 4, -1},
      {5, 4, 0, 5, 0, 2, 5, 2, 10, -1, -1, -1, -1},
      {5, 4, 9, 3, 0, 8, 1, 2, 10, -1, -1, -1, -1},
      {5, 4, 9, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 8, 5, 8, 3, 5, 3, 1, -1, -1, -1, -1},
      {5, 4, 0, 5, 0, 1, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 9, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {5, 4, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {11, 7, 4, 11, 4, 9, 11, 9, 10, -1, -1, -1, -1},
      {11, 7, 4, 11, 4, 9, 11, 9, 10, 3, 0, 8, -1},
      {11, 7, 4, 11, 4, 0, 11, 0, 1, 11, 1, 10, -1},
      {4, 7, 8, 3, 11, 10, 3, 10, 1, -1, -1, -1, -1},
      {11, 7, 4, 11, 4, 9, 11, 9, 1, 11, 1, 2, -1},
      {4, 7, 8, 0, 1, 9, 2, 3, 11, -1, -1, -1, -1},
      {4, 7, 11, 4, 11, 2, 4, 2, 0, -1, -1, -1, -1},
      {4, 7, 8, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
      {7, 4, 9, 7, 9, 10, 7, 10, 2, 7, 2, 3, -1},
      {4, 7, 8, 2, 10, 9, 2, 9, 0, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 0, 1, 2, 10, -1, -1, -1, -1},
      {4, 7, 8, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 1, 4, 1, 9, -1, -1, -1, -1},
      {4, 7, 8, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 3, 4, 3, 0, -1, -1, -1, -1, -1, -1, -1},
      {4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {11, 8, 9, 11, 9, 10, -1, -1, -1, -1, -1, -1, -1},
      {3, 11, 10, 3, 10, 9, 3, 9, 0, -1, -1, -1, -1},
      {11, 10, 1, 11, 1, 0, 11, 0, 8, -1, -1, -1, -1},
      {3, 11, 10, 3, 10, 1, -1, -1, -1, -1, -1, -1, -1},
      {11, 2, 1, 11, 1, 9, 11, 9, 8, -1, -1, -1, -1},
      {2, 3, 11, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
      {11, 2, 0, 11, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {2, 10, 9, 2, 9, 8, 2, 8, 3, -1, -1, -1, -1},
      {2, 10, 9, 2, 9, 0, -1, -1, -1, -1, -1, -1, -1},
      {1, 2, 10, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
      {1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {1, 9, 8, 1, 8, 3, -1, -1, -1, -1, -1, -1, -1},
      {0, 1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {3, 0, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
      {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    };


void setup(){
  size(600,400,P3D);
  colorMode(HSB);
  int index=0;
  int n=25,m=-24;
  int a=10,b=-10;
  int r=180;

  //determineisolevel
 for(int x=m; x<=n; x++){//gridvalue noxyzto forbunno xyz gaattenaihuan
   for(int y=m; y<=n; y++){
     for(int z=m; z<=n; z++){
       
       gridvalue[index][0]=r/sqrt(((x-1)-a)*((x-1)-a)+((y-1)-a)*((y-1)-a)+((z-1)-a)*((z-1)-a))+r/sqrt(((x-1)-b)*((x-1)-b)+((y-1)-b)*((y-1)-b)+((z-1)-b)*((z-1)-b));
       gridvalue[index][1]=r/sqrt(((x-1)-a)*((x-1)-a)+((y-1)-a)*((y-1)-a)+(z-a)*(z-a))+r/sqrt(((x-1)-b)*((x-1)-b)+((y-1)-b)*((y-1)-b)+(z-b)*(z-b));
       gridvalue[index][2]=r/sqrt((x-a)*(x-a)+((y-1)-a)*((y-1)-a)+(z-a)*(z-a))+r/sqrt((x-b)*(x-b)+((y-1)-b)*((y-1)-b)+(z-b)*(z-b));
       gridvalue[index][3]=r/sqrt((x-a)*(x-a)+((y-1)-a)*((y-1)-a)+((z-1)-a)*((z-1)-a))+r/sqrt((x-b)*(x-b)+((y-1)-b)*((y-1)-b)+((z-1)-b)*((z-1)-b));
       gridvalue[index][4]=r/sqrt(((x-1)-a)*((x-1)-a)+(y-a)*(y-a)+((z-1)-a)*((z-1)-a))+r/sqrt(((x-1)-b)*((x-1)-b)+(y-b)*(y-b)+((z-1)-b)*((z-1)-b));
       gridvalue[index][5]=r/sqrt(((x-1)-a)*((x-1)-a)+(y-a)*(y-a)+(z-a)*(z-a))+r/sqrt(((x-1)-b)*((x-1)-b)+(y-b)*(y-b)+(z-b)*(z-b));
       gridvalue[index][6]=r/sqrt((x-a)*(x-a)+(y-a)*(y-a)+(z-a)*(z-a))+r/sqrt((x-b)*(x-b)+(y-b)*(y-b)+(z-b)*(z-b));
       gridvalue[index][7]=r/sqrt((x-a)*(x-a)+(y-a)*(y-a)+((z-1)-a)*((z-1)-a))+r/sqrt((x-b)*(x-b)+(y-b)*(y-b)+((z-1)-b)*((z-1)-b));

       
       xyz[index][0] = new XYZ(x-1, y-1, z-1);
       xyz[index][1] = new XYZ(x-1, y-1, z);
       xyz[index][2] = new XYZ(x, y-1, z);
       xyz[index][3] = new XYZ(x, y-1, z-1);
       xyz[index][4] = new XYZ(x-1, y, z-1);
       xyz[index][5] = new XYZ(x-1, y, z);
       xyz[index][6] = new XYZ(x, y, z);
       xyz[index][7] = new XYZ(x, y, z-1);
       
       index+=1;
     }
   }
  }
  
}

void draw(){
 background(255);
 int index=0;
 float isolevel=20;
 int n=25,m=-24;
 int a=10,b=-10;
 int r=8000;
 noStroke();

 
 for(int x=m; x<n; x++){ //<>//
   for(int y=m; y<n; y++){
     for(int z=m; z<n; z++){
       float d=dist(x,y,z,a,a,a)+dist(x,y,z,b,b,b);
       fill(r/d, 255, 255);
       marchingcubes(isolevel, index, edgeTable, triTable, gridvalue);
   
       index+=1;
     }
   }
 }

 camera(0, 60, -60, 0, 0, 0, 0, -1, 0);
}





void marchingcubes(float isolevel, int index, int[][] edgeTable, int[][] triTable, float[][] gridvalue)
{
   int i,n;
   int cubeindex;
   XYZ[] vertlist = new XYZ[12];//change
   XYZ[] triangles = new XYZ[3];

   cubeindex = 0;
   if (gridvalue[index][0] < isolevel) cubeindex += 1;
   if (gridvalue[index][1] < isolevel) cubeindex += 2;
   if (gridvalue[index][2] < isolevel) cubeindex += 4;
   if (gridvalue[index][3] < isolevel) cubeindex += 8;
   if (gridvalue[index][4] < isolevel) cubeindex += 16;
   if (gridvalue[index][5] < isolevel) cubeindex += 32;
   if (gridvalue[index][6] < isolevel) cubeindex += 64;
   if (gridvalue[index][7] < isolevel) cubeindex += 128;

  //what do is which edge is lower than isolevel
   i=0;
   while(edgeTable[cubeindex][i] != -1){
     if(edgeTable[cubeindex][i]<7){
       n=edgeTable[cubeindex][i];
       vertlist[n] =
         VertexInterp(isolevel, xyz[index][n], xyz[index][n+1], gridvalue[index][n], gridvalue[index][n+1]);
     }
     else if(edgeTable[cubeindex][i]==7){
       vertlist[7] =
         VertexInterp(isolevel,xyz[index][7],xyz[index][4],gridvalue[index][7],gridvalue[index][4]);
     }
     else if(edgeTable[cubeindex][i]==8){
       vertlist[8] =
         VertexInterp(isolevel,xyz[index][0],xyz[index][4],gridvalue[index][0],gridvalue[index][4]);
     }
     else if(edgeTable[cubeindex][i]==9){
       vertlist[9] =
         VertexInterp(isolevel,xyz[index][1],xyz[index][5],gridvalue[index][1],gridvalue[index][5]);
             
     }
     else if(edgeTable[cubeindex][i]==10){
       vertlist[10] =
         VertexInterp(isolevel,xyz[index][2],xyz[index][6],gridvalue[index][2],gridvalue[index][6]);
     }
      else if(edgeTable[cubeindex][i]==11){
       vertlist[11] =
         VertexInterp(isolevel,xyz[index][3],xyz[index][7],gridvalue[index][3],gridvalue[index][7]);    
     }
     
     i+=1;
   }
    float sum=0;
   /* Create the triangle */
   for (i=0;triTable[cubeindex][i]!=-1;i+=3) {
      triangles[0] = vertlist[triTable[cubeindex][i  ]];
      triangles[1] = vertlist[triTable[cubeindex][i+1]];
      triangles[2] = vertlist[triTable[cubeindex][i+2]];
      beginShape(TRIANGLES);
        vertex(triangles[0].pos.x, triangles[0].pos.y, triangles[0].pos.z);
        vertex(triangles[1].pos.x, triangles[1].pos.y, triangles[1].pos.z);
        vertex(triangles[2].pos.x, triangles[2].pos.y, triangles[2].pos.z);
      endShape();

   } 
}
     




//float[] VertexInterp(float a, float valp1, float valp2, float x1, float y1, float z1, float x2, float y2, float z2){
XYZ VertexInterp(float a, XYZ p1, XYZ p2, float valp1, float valp2){
   float isolevel=a;
   float val1=valp1,val2=valp2;
   float mu;
   XYZ p = new XYZ(0,0,0);
   
   //if (abs(isolevel-val1) < 0.00001)
   //   return (p1);
   //if (abs(isolevel-val2) < 0.00001)
   //   return(p2);
   //if (abs(valp1-val2) < 0.00001)
   //   return(p1);
   mu = (isolevel - val1) / (val2 - val1);
   p.pos.x = p1.pos.x + mu * (p2.pos.x - p1.pos.x);
   p.pos.y = p1.pos.y + mu * (p2.pos.y - p1.pos.y);
   p.pos.z = p1.pos.z + mu * (p2.pos.z - p1.pos.z);

   return(p);
}


class XYZ {
  PVector pos;
  
  XYZ(float x, float y, float z){
    pos =new PVector(x,y,z);
  }  
 
}
