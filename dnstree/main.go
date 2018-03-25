package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"os"
	"strconv"
	"time"

	"github.com/florianl/dnstree"
)

func main() {
	var count int
	var tests = []string{"google.com", "facebook.com", "github.com", "heise.de", "abc.xyz"}

	if len(os.Args) != 2 {
		fmt.Printf("Usage: %s data.csv\n", os.Args[0])
		return
	}

	f, err := os.Open(os.Args[1])
	if err != nil {
		fmt.Println(err)
	}
	defer f.Close()

	reader := csv.NewReader(f)

	start := time.Now()
	for {
		record, err := reader.Read()
		if err != nil && err == io.EOF {
			break
		} else if err != nil {
			fmt.Println(err)
		}
		rank, _ := strconv.Atoi(record[0])
		dnstree.Insert(record[1], rank)
		count++
	}
	elapsed := time.Since(start)
	fmt.Println("needed", elapsed, "to process", count, "elements")

	for _, test := range tests {
		start = time.Now()
		rank, _ := dnstree.Search(test)
		elapsed = time.Since(start)
		fmt.Println(test, "is on", rank, "and was found in", elapsed)
	}
}
